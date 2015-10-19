#!/usr/bin/env RScript
# Import some required libraries
## Setup R error handling to go to stderr
library('getopt');
### code chunk: Load all required libraries quietly
library(ELMER, quietly=TRUE, warn.conflicts=FALSE,verbose = FALSE)

# Make an option specification, with the following arguments:
# 1. long flag
# 2. short flag
# 3. argument type: 0: No argument, 1: required, 2: optional
# 4. target data type
option_specification = matrix(c(
  'disease','d',1,'character',
  'Meth','m',1,'character',
  'RNA', 'g', 1, 'character',
  'Clinic', 'c', 1, 'character',
  'RNAtype','r',2,'character',
  'Methfilter','mf',2,'integer'
), byrow=TRUE, ncol=4);

# Parse options
options = getopt(option_specification);

# IF disease type NOT available, stop.
if(is.null(options$disease)){
   stop("The disease name should be from TCGA")
}

# Download all TCGA data
getTCGA(options$disease, Meth = options$Meth, RNA = options$RNA,
	 Clinic = options$Clinic,basedir = "./Data", RNAtype = options$RNAtype,
	 Methfilter = options$Methfilter)
