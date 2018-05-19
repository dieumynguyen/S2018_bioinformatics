#!/bin/bash
#SBATCH --job-name=bowtie2_CMW # Job name
#SBATCH --mail-type=NONE # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=coin8046@colorado.edu # Where to send mail
#SBATCH --nodes=1 # Run on a single node
#SBATCH --ntasks=10     # Number of CPU (processer cores i.e. tasks)
#SBATCH --mem=5gb # Memory limit
#SBATCH --time=01:00:00 # Time limit hrs:min:sec
#SBATCH --output=/scratch/Users/coin8046/MCDB4521/PlantMicro_project/mapping/mapping_EO/bowtie2_psyr.%j.out # Standard output
#SBATCH --error=/scratch/Users/coin8046/MCDB4521/PlantMicro_project/mapping/mapping_EO/bowtie2_psyr.%j.err # Standard error log


### Display the job context
echo Running on host `hostname`
echo Time is `date`
echo Directory is `pwd`

### Assign path to variable for convenience later.
PLANT_MICRO=/scratch/Users/coin8046/MCDB4521/PlantMicro_project/mapping

### Load modules
module load samtools/1.3.1
module load bowtie/2.2.9

### map reads with bowtie2
### bowtie2 [options]* -x <bt2-idx> {-1 <m1> -2 <m2> | -U <r>} [-S <sam>]

bowtie2 -t --very-sensitive -p 10 \
-x $PLANT_MICRO/Psyringae_genome/Index/Index \
-U $PLANT_MICRO/fastq_files/SRR6003718.fastq \
-S $PLANT_MICRO/bowtie2_SRR6003718.sam \
2>$PLANT_MICRO/bowtie2_SRR6003718.stderr


### convert SAM to BAM
### samtools view [options] <in.bam>|<in.sam>|<in.cram> [region ...]
samtools view -Sb -o $PLANT_MICRO/bowtie2_SRR6003718.bam $PLANT_MICRO/bowtie2_SRR6003718.sam

### sort BAM
### Usage: samtools sort [options...] [in.bam]
samtools sort $PLANT_MICRO/bowtie2_SRR6003718.bam -o $PLANT_MICRO/bowtie2_SRR6003718.sorted.bam

### Index sorted BAM file; needed for downstream steps
### Usage: samtools index [-bc] [-m INT] <in.bam> [out.index]
samtools index $PLANT_MICRO/bowtie2_SRR6003718.sorted.bam

#Final time stamp
echo Time is `date`                                             1,1           Top


################################## WORKING SCRIPT

#!/bin/bash
#SBATCH --job-name=DMN_bowtie2_map # Job name
#SBATCH --mail-type=ALL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=ding1018@colorado.edu # Where to send mail
#SBATCH --nodes=1 # Run on a single node
#SBATCH --ntasks=10     # Number of CPU (processer cores i.e. tasks)
#SBATCH --mem=5gb # Memory limit
#SBATCH --time=01:00:00 # Time limit hrs:min:sec
#SBATCH --output=/scratch/Shares/dk/bee_brain/mapping_eofiles/bowtie2_map.%j.out # Standard output
#SBATCH --error=/scratch/Shares/dk/bee_brain/mapping_eofiles/bowtie2_map.%j.err # Standard error log


### Display the job context
echo Running on host `hostname`
echo Time is `date`
echo Directory is `pwd`

### Assign path to variable for convenience later.
BEE_BRAIN=/scratch/Shares/dk/bee_brain

### Load modules
module load samtools/1.3.1
module load bowtie/2.2.9

### map reads with bowtie2
### bowtie2 [options]* -x <bt2-idx> {-1 <m1> -2 <m2> | -U <r>} [-S <sam>]

bowtie2 -t --very-sensitive -p 10 \
-x $BEE_BRAIN/ref_index/ref_genome \
-U $BEE_BRAIN/fastq/SRR4045877.fastq \
-S $BEE_BRAIN/SRR4045877_C_30m/bowtie2_SRR4045877.sam \
2>$BEE_BRAIN/SRR4045877_C_30m/bowtie2_SRR4045877.stderr


### convert SAM to BAM
### samtools view [options] <in.bam>|<in.sam>|<in.cram> [region ...]
samtools view -Sb -o $BEE_BRAIN/SRR4045877_C_30m/bowtie2_SRR4045877.bam $BEE_BRAIN/SRR4045877_C_30m/bowtie2_SRR4045877.sam

### sort BAM
### Usage: samtools sort [options...] [in.bam]
samtools sort $BEE_BRAIN/SRR4045877_C_30m/bowtie2_SRR4045877.bam -o $BEE_BRAIN/SRR4045877_C_30m/bowtie2_SRR4045877.sorted.bam

### Index sorted BAM file; needed for downstream steps
### Usage: samtools index [-bc] [-m INT] <in.bam> [out.index]
samtools index $BEE_BRAIN/SRR4045877_C_30m/bowtie2_SRR4045877.sorted.bam

#Final time stamp
echo Time is `date`



##################################

### OLD CODE

#!/bin/bash
#SBATCH --job-name=BEE_BRAINS # Job name
#SBATCH --mail-type=END # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=ding1018@colorado.edu # Where to send mail
#SBATCH --nodes=1  # Number of distinct nodes requested
#SBATCH --ntasks=1 # Number of CPU (processer cores i.e. tasks)
#SBATCH --time=04:00:00 # Time limit hrs:min:sec
#SBATCH -p short
#SBATCH --mem=8gb # Memory limit
#SBATCH --output=/Users/ding1018/bee_brain/eofiles/map_genome.out
#SBATCH --error=/Users/ding1018/bee_brain/eofiles/map_genome.err


pwd; hostname; date
date
module load bowtie/2.2.9
bowtie2 -q --phred33 --fast -p 16 -x /Users/ding1018/bee_brain/INDEX/ref_genome -U  /Users/ding1018/bee_brain/fastq/SRR4045880.fastq -S /Users/ding1018/bee_brain/SRR4045880.sam 2>/Users/ding1018/bee_brain/map_results.stderr
echo download
date

##################################

#!/bin/bash
#SBATCH --job-name=DMN_bowtie2_map # Job name
#SBATCH --mail-type=ALL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=ding1018@colorado.edu # Where to send mail
#SBATCH --nodes=1 # Run on a single node
#SBATCH --ntasks=10     # Number of CPU (processer cores i.e. tasks)
#SBATCH --mem=5gb # Memory limit
#SBATCH --time=01:00:00 # Time limit hrs:min:sec
#SBATCH --output=/scratch/Shares/dk/bee_brain/mapping_eofiles/bowtie2_map.%j.out$
#SBATCH --error=/scratch/Shares/dk/bee_brain/mapping_eofiles/bowtie2_map.%j.err $


### Display the job context
echo Running on host `hostname`
echo Time is `date`
echo Directory is `pwd`

### Assign path to variable for convenience later.
BEE_BRAIN=/scratch/Shares/dk/bee_brain

### Load modules
module load samtools/1.3.1
module load bowtie/2.2.9

### map reads with bowtie2
### bowtie2 [options]* -x <bt2-idx> {-1 <m1> -2 <m2> | -U <r>} [-S <sam>]

bowtie2 -t --very-sensitive -p 10 \
-x $BEE_BRAIN/ref_index/ref_genome \
-U $BEE_BRAIN/fastq/SRR4045881.fastq \
-S $BEE_BRAIN/SRR4045881_X_30m/bowtie2_SRR4045881.sam \
2>$BEE_BRAIN/SRR4045881_X_30m/bowtie2_SRR4045881.stderr


### convert SAM to BAM
### samtools view [options] <in.bam>|<in.sam>|<in.cram> [region ...]
samtools view -Sb -o $BEE_BRAIN/SRR4045881_X_30m/bowtie2_SRR4045881.bam $BEE_BRAIN/SRR4045881_X_30m/bowtie2_SRR4045881.sam

### sort BAM
### Usage: samtools sort [options...] [in.bam]
samtools sort $BEE_BRAIN/SRR4045881_X_30m/bowtie2_SRR4045881.bam -o $BEE_BRAIN/SRR4045881_X_30m/bowtie2_SRR4045881.sorted.bam

### Index sorted BAM file; needed for downstream steps
### Usage: samtools index [-bc] [-m INT] <in.bam> [out.index]
samtools index $BEE_BRAIN/SRR4045881_X_30m/bowtie2_SRR4045881.sorted.bam

#Final time stamp
echo Time is `date`
