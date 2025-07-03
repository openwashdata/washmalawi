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
library(maps)

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



# Filter usable water point locations
water_map_data <- washmalawi %>%
  filter(!is.na(latitude) & !is.na(longitude))  # Ensure geo-points are valid

# Get Malawi map outline
malawi_map <- map_data("world", region = "Malawi")

# Plot the water point locations
ggplot() +
  geom_polygon(data = malawi_map, aes(x = long, y = lat, group = group),
               fill = "gray90", color = "gray70") +
  geom_point(data = water_map_data,
             aes(x = longitude, y = latitude, color = water_source_type),
             size = 2, alpha = 0.7) +
  coord_fixed(1.3) +
  labs(
    title = "Geo-Referenced Water Point Locations in Malawi",
    x = "Longitude", y = "Latitude", color = "Water Source Type"
  ) +
  theme_minimal(base_size = 13) +
  theme(legend.position = "bottom")

