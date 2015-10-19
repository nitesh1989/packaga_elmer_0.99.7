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
  'disease','i',1,'character'
), byrow=TRUE, ncol=4);

# Parse options
options = getopt(option_specification);

# IF disease type NOT available, stop.
if(is.null(options$disease)){
   stop("The disease name should be from TCGA")
}

get450K(options$disease, basedir = "./Data")