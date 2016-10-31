#!/usr/bin/env Rscript
# Created: `date +%F`
# Author: ${1:`id -u -n`}

library(${2:tidyverse})

theme_set(theme_bw())

# Start main script ############################################################
${0}
