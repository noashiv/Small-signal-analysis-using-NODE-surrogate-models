"""
EarlyStopping — stops training once validation loss stops improving, and
remembers the best model weights seen so far so they can be restored at the
end (instead of keeping whatever weights training happened to end on, which
may already be overfitting).
"""


class EarlyStopping:
    def __init__(self, patience=10, min_delta=0.0):
        # How many epochs in a row without improvement before we give up.
        self.patience = patience
        # Minimum drop in the metric to count as an "improvement" (guards
        # against stopping being reset by noise-level fluctuations).
        self.min_delta = min_delta

        self.best = None        # best metric value seen so far
        self.best_state = None  # model weights at the time `best` was recorded
        self.bad = 0            # consecutive epochs with no improvement
        self.stop = False       # set True once patience is exhausted

    def step(self, metric, model):
        """
        Call this once per epoch with the current validation metric (lower
        is better) and the model. Returns True once training should stop.
        """
        # First call just sets the baseline — nothing to compare against yet.
        if self.best is None:
            self.best = metric
            self.best_state = {k: v.detach().clone() for k, v in model.state_dict().items()}
            return False

        # `metric <= self.best - min_delta` requires the new metric to beat
        # the previous best by at least `min_delta`, not just be
        # numerically smaller. E.g. with best=1.000 and min_delta=0.01, a
        # new metric of 0.995 does NOT count as improved (1.000-0.01=0.990,
        # and 0.995 > 0.990) — it's better, but only by a sliver that could
        # just be noise, so `bad` still increments. A new metric of 0.985
        # does count (0.985 <= 0.990). With the default min_delta=0.0, any
        # strict improvement at all counts.
        improved = metric <= self.best - self.min_delta

        if improved:
            self.best = metric
            self.bad = 0  # reset the "epochs without improvement" streak
            self.best_state = {k: v.detach().clone() for k, v in model.state_dict().items()}
        else:
            # No (meaningful) improvement this epoch — extend the bad streak.
            self.bad += 1
            if self.bad >= self.patience:
                self.stop = True
                print("[EarlyStopping] Patience exhausted. Stopping.")

        return self.stop

    def restore(self, model):
        """Loads the best-seen weights back into `model` (call after training ends)."""
        if self.best_state is not None:
            model.load_state_dict(self.best_state)
            print("[EarlyStopping] Restored best model weights.")
