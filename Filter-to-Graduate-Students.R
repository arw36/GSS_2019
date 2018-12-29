library(tidyverse)
dat <- read.csv('GSS-2019_AbstractSubmission_12Dec2018.csv', stringsAsFactors=FALSE, colClasses = "character")
grad_dat <- dplyr::filter(dat, Position != "Undergraduate student")

# remove duplicates and tests 
'%!in%' <- function(x,y)!('%in%'(x,y)) 

grad_dat <- dplyr::filter(grad_dat, Start.time %!in% c("11/9/18 13:00:40", "10/8/18 17:06:48", "11/5/18 12:12:38", "11/5/18 12:27:36", "10/30/18 8:04:47", "11/5/18 12:12:38", "11/9/18 13:00:40", "11/5/18 12:27:36"))
# get rid of bottom empty row 
grad_dat <- grad_dat[!apply(grad_dat == "", 1, all),]
write.csv(grad_dat, file = "Graduate_submissions_2019.csv")