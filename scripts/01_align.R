date <- Sys.Date()
sink(paste0(date, "-align.log"), split = TRUE)
library(BiocVersion) # load this to view the version in sessionInfo
library(Rsubread)
R1 <- dir(full.names=TRUE, path="/stornext/Bioinf/data/bioinf-data/Papenfuss_lab/projects/ginerg_papenfuss_lab/Github_projects/SDiepstraten_2021_05_14/fastqfiles/", pattern="*_R1")
R2 <- dir(full.names=TRUE, path="/stornext/Bioinf/data/bioinf-data/Papenfuss_lab/projects/ginerg_papenfuss_lab/Github_projects/SDiepstraten_2021_05_14/fastqfiles/", pattern="*_R2")
bam <- sub("\\.fastq.gz",".bam",basename(R1))
mm10 <- "/stornext/General/data/academic/lab_smyth/smyth/Genome/UCSC/mm10"
Mapping_results <- align(mm10,R1,R2,output_file=bam,useAnnotation=TRUE,annot.inbuilt="mm10",nthreads=16,sortReadsByCoordinates=TRUE)
save(file = "Mapping_results.RData", Mapping_results)
print(sessionInfo())
sink()
