#!/bin/sh  

### General options  

### -- specify queue --  

#BSUB -q gpua100  

### -- set the job Name --  

#BSUB -J fixedp 

### -- ask for number of cores (default: 1) --  

#BSUB -n 4 

### -- specify that we need 4GB of memory per core/slot --  

#BSUB -R "rusage[mem=16GB]" 

#BSUB -R "span[hosts=1]" 

#BSUB -gpu "num=1:mode=exclusive_process" 

### -- set walltime limit: hh:mm --  

#BSUB -W 24:00  

### -- set the email address --  

# please uncomment the following line and put in your e-mail address, 

# if you want to receive e-mail notifications on a non-default address 

##BSUB -u your_email_address 

### -- Specify the output and error file. %J is the job-id --  

### -- -o and -e mean append, -oo and -eo mean overwrite --  

#BSUB -o Output_fixed%J.out  

#BSUB -e Output_fixed%J.err  

 

source /zhome/84/1/154964/miniforge3/etc/profile.d/conda.sh 

conda activate /zhome/84/1/154964/miniforge3/envs/ra_gpu

 
python -u /zhome/84/1/154964/RAMSES/NeuralODES/fixedpoints.py