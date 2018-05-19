#!/bin/bash
#SBATCH --job-name=DMN_bowtie_build # Job name
#SBATCH --mail-type=ALL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=ding1018@colorado.edu# Where to send mail
#SBATCH --nodes=1  # Number of distinct nodes requested
#SBATCH --ntasks=1 # Number of CPU (processer cores i.e. tasks)
#SBATCH --time=04:00:00 # Time limit hrs:min:sec
#SBATCH -p short
#SBATCH --mem=20gb # Memory limit
#SBATCH --output=/scratch/Shares/dk/bee_brain/build_eofiles/index_EO.%j.out
#SBATCH --error=/scratch/Shares/dk/bee_brain/build_eofiles/index_EO.%j.err

pwd; hostname; date
date
module load bowtie/2.2.9

GENOME=/scratch/Shares/dk/bee_brain/ref_genome


bowtie2-build -f $GENOME/GCF_000002195.4_Amel_4.5_genomic.fna $GENOME

echo qual
date


################################################################################

#!/bin/bash
#SBATCH --job-name=CMW_bowtie_build # Job name
#SBATCH --mail-type=ALL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=coin8046@colorado.edu# Where to send mail
#SBATCH --nodes=1  # Number of distinct nodes requested
#SBATCH --ntasks=1 # Number of CPU (processer cores i.e. tasks)
#SBATCH --time=04:00:00 # Time limit hrs:min:sec
#SBATCH -p short
#SBATCH --mem=20gb # Memory limit
#SBATCH --output=/scratch/Users/coin8046/MCDB4521/PlantMicro_project/Psyringae_genome/Index/Index_EO.%j.out
#SBATCH --error=/scratch/Users/coin8046/MCDB4521/PlantMicro_project/Psyringae_genome/Index/Index_EO.%j.err

pwd; hostname; date
date
module load bowtie/2.2.9

GENOME=/scratch/Users/coin8046/MCDB4521/PlantMicro_project/Psyringae_genome
/scratch/Users/coin8046/MCDB4521/PlantMicro_project/Psyringae_genome/Index/


bowtie2-build -f $GENOME/Pseudomonas_syringae_group_genomosp__3_DC3000_111.fna $GENOME/Bowtie2Indexes/Index/

echo qual
date
~
~
~
~
