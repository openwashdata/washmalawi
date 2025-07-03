# Description ------------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame
# 
# This script reads the SDG Household Level Survey data for Malawi and performs
# basic data cleaning before exporting to multiple formats (.rda, .csv, .xlsx)
# Load packages ----------------------------------------------------------------
## Run the following code in console if you don't have the packages
## install.packages(c("usethis", "fs", "here", "readr", "readxl", "openxlsx"))
library(usethis)
library(fs)
library(here)
library(readr)
library(dplyr)
library(readxl)
library(openxlsx)
library(lubridate)

# Load Data --------------------------------------------------------------------
# Load the necessary data from a CSV file
data_in <- readr::read_csv("data-raw/SDG Household Level Survey.csv")

# (Optional) Read and clean the codebook if needed (commented out for now)
# codebook <- readxl::read_excel("data-raw/codebook.xlsx") %>%
#   clean_names()

# Tidy data --------------------------------------------------------------------
# Remove rows where the 'latitude' column contains NULL (NA) values
data_in <- data_in %>%
  filter(!is.na(latitude))

# Date processing: Convert from m/d/y H:M format to d/m/y character format
data_in <- data_in %>%
  mutate(date_submitted = mdy_hm(date_submitted),
         date_submitted = as.Date(date_submitted))

# Reformat the date to d/m/y format (character format)
data_in <- data_in %>%
  mutate(date_submitted = format(date_submitted, "%d/%m/%Y"))

# Note: Column names in the raw data appear to already match the final variable names
# documented in dictionary.csv. No explicit renaming step is shown here.

# Assign data to a variable
washmalawi <- data_in

# Export Data ------------------------------------------------------------------
usethis::use_data(washmalawi, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))
readr::write_csv(washmalawi,
                 here::here("inst", "extdata", paste0("washmalawi", ".csv")))
openxlsx::write.xlsx(washmalawi,
                     here::here("inst", "extdata", paste0("washmalawi",
                                                          ".xlsx")))


