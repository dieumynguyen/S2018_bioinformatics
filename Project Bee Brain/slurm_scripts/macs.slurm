#!/bin/bash
#SBATCH --job-name=DMN_MACS_30 # Job name
#SBATCH --mail-type=ALL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=ding1018@colorado.edu# Where to send mail
#SBATCH --nodes=1  # Number of distinct nodes requested
#SBATCH --ntasks=1 # Number of CPU (processer cores i.e. tasks)
#SBATCH --time=04:00:00 # Time limit hrs:min:sec
#SBATCH -p short
#SBATCH --mem=20gb # Memory limit
#SBATCH --output=/scratch/Shares/dk/bee_brain/macs_eofiles/peaks_EO.%j.out
#SBATCH --error=/scratch/Shares/dk/bee_brain/macs_eofiles/peaks_EO.%j.err

pwd; hostname; date
date
module load python/2.7.14/MACS/2.1.1

HERE=/scratch/Shares/dk/bee_brain

macs2 callpeak \
-t $HERE/SRR4045881_X_30m/bowtie2_SRR4045881.sorted.bam \
-c $HERE/SRR4045877_C_30m/bowtie2_SRR4045877.sorted.bam \
-f BAM -g 2.46e8 -B -q 0.01 -n $HERE/macs_out/chip_30m

echo qual
date
