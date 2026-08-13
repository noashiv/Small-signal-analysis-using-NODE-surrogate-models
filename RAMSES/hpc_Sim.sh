#!/bin/bash

### ============================================================
### LSF job settings
### ============================================================

### Use the CPU queue
#BSUB -q hpc

### Job name
#BSUB -J ramses_data

### Number of CPU cores
#BSUB -n 1

### Memory request
# Depending on the HPC configuration, this may mean memory per slot.
# Start moderately and increase if the job runs out of memory.
#BSUB -R "rusage[mem=8GB]"

### Keep all requested cores on the same host
#BSUB -R "span[hosts=1]"

### Maximum runtime: hh:mm
#BSUB -W 24:00

### Overwrite output and error logs
#BSUB -oo ramses_data_%J.out
#BSUB -eo ramses_data_%J.err

### Optional email notifications
##BSUB -u your_email@example.com
##BSUB -B
##BSUB -N


### ============================================================
### Stop if a shell command fails
### ============================================================

set -e


### ============================================================
### Paths 
### ============================================================

PROJECT_DIR="/zhome/xx/x/s203681/NOA-MASTERS-MAIN"

PYTHON_SCRIPT="${PROJECT_DIR}/Sim.py"

CONDA_SETUP="/zhome/xx/x/s203681/miniforge3/etc/profile.d/conda.sh"

CONDA_ENV="/zhome/xx/x/s203681/miniforge3/envs/ra"

# This must point to the Linux RAMSES installation on the HPC.
RAMSES_DIR="/zhome/xx/x/s203681/ramses/Release_intel_linux"


### ============================================================
### Prepare environment
### ============================================================

source "${CONDA_SETUP}"
conda activate "${CONDA_ENV}"

cd "${PROJECT_DIR}"

# Make the RAMSES path available to the Python program.
export RAMSES_PATH="${RAMSES_DIR}"

# Avoid excessive threading inside numerical libraries.
export OMP_NUM_THREADS="${LSB_DJOB_NUMPROC:-1}"
export MKL_NUM_THREADS="${LSB_DJOB_NUMPROC:-1}"
export OPENBLAS_NUM_THREADS="${LSB_DJOB_NUMPROC:-1}"

echo "============================================================"
echo "RAMSES dataset generation"
echo "============================================================"
echo "Job ID:          ${LSB_JOBID:-unknown}"
echo "Host:            $(hostname)"
echo "Working folder:  $(pwd)"
echo "Python:          $(which python)"
echo "RAMSES path:     ${RAMSES_PATH}"
echo "CPU cores:       ${LSB_DJOB_NUMPROC:-1}"
echo "Start time:      $(date)"
echo "============================================================"


### ============================================================
### Basic checks
### ============================================================

if [ ! -f "${PYTHON_SCRIPT}" ]; then
    echo "ERROR: Python script not found:"
    echo "${PYTHON_SCRIPT}"
    exit 1
fi

if [ ! -f "${PROJECT_DIR}/cmd.txt" ]; then
    echo "ERROR: cmd.txt was not found in:"
    echo "${PROJECT_DIR}"
    exit 1
fi

if [ ! -d "${RAMSES_PATH}" ]; then
    echo "ERROR: RAMSES directory not found:"
    echo "${RAMSES_PATH}"
    exit 1
fi


### ============================================================
### Run the Python simulation program
### ============================================================

python -u "${PYTHON_SCRIPT}"

echo "============================================================"
echo "Job completed at: $(date)"
echo "============================================================"