###################################################
# code chunk number 1: Record starting time
###################################################
timeStart <- as.character(Sys.time())

### code chunk number 2: Load all required libraries
msg.out1 <- capture.output( suppressMessages( library(IlluminaHumanMethylation450kanno.ilmn12.hg19,quietly=TRUE,warn.conflicts=FALSE,verbose=FALSE)))
msg.out2 <- capture.output( suppressMessages( library(ELMER,quietly=TRUE,warn.conflicts=FALSE,verbose=FALSE)))
require("getopt",quietly=TRUE)

### code chunk number 3: Update package version
if (packageVersion("ELMER") < "0.99.7") {
  stop("Please update 'ELMER' to version >= 0.99.8  to run this tool")
}

# Make an option specification, with the following arguments:
# 1. input is a gdac downloaded TCGA matrix
# 2. output is an optional

option_specification = matrix(c(
  'input_disease', 'i', 1, 'character',
  'output_dir','o', 2, 'character'
), byrow=TRUE, ncol=4);

# Parse options
options = getopt(option_specification);

# Get the TCGA data
dat = getTCGA(disease = disease,Meth = FALSE, RNA = TRUE,
              Clinic = TRUE, basedir = "./Data", RNAtype = "gene", Methfilter = 0.2)

