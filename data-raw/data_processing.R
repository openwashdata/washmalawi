# Description ------------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame
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
library(ggplot2)

# Load Data --------------------------------------------------------------------
# Load the necessary data from a CSV file
data_in <- readr::read_csv("data-raw/SDG Household Level Survey (Malawi CJF).csv")

# (Optional) Read and clean the codebook if needed (commented out for now)
# codebook <- readxl::read_excel("data-raw/codebook.xlsx") %>%
#   clean_names()

# Tidy data --------------------------------------------------------------------
# Remove rows where the 'latitude' column contains NULL (NA) values
data_in <- data_in %>%
  filter(!is.na(latitude))

# Convert 'date_submitted' column to Date type (assuming it's in m/d/y format)
data_in <- data_in %>%
  mutate(date_submitted = mdy_hm(date_submitted),
         date_submitted = as.Date(date_submitted))


# Reformat the date to d/m/y format (character format)
data_in <- data_in %>%
  mutate(date_submitted = format(date_submitted, "%d/%m/%Y"))

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

