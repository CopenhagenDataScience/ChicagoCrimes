library(fs)
library(tidyverse)

force <- as.logical(commandArgs(trailingOnly = TRUE))
data_url <- "https://data.cityofchicago.org/api/views/ijzp-q8t2/rows.csv?accessType=DOWNLOAD"

if (length(force) == 0) {
  force <- FALSE
} else if (length(force) > 1) {
  stop("Argument has to be of length 1")
} else if (length(force) == 1) {
  if (!is.finite(force)) {
    stop("Force argument must be either TRUE or FALSE")
  }
}

if (!dir_exists("data")) {
  dir_create("data")
  download.file(data_url, "data/crimes.csv")
} else if (!file_exists("data/crimes.csv")) {
  download.file(data_url, "data/crimes.csv")
} else if (force) {
  download.file(data_url, "data/crimes.csv")
}
