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

# Function to check for non-UTF-8 characters in character columns
check_utf8 <- function(df) {
  # Identify columns with invalid UTF-8 characters
  invalid_cols <- sapply(df, function(column) {
    if (!is.character(column)) return(FALSE) # Skip non-character columns
    any(sapply(column, function(x) {
      if (is.na(x)) return(FALSE) # Ignore NA values
      !identical(iconv(x, from = "UTF-8", to = "UTF-8"), x)
    }))
  })

  # Extract the column names with invalid characters
  bad_cols <- names(df)[invalid_cols]

  # Output a message depending on whether non-UTF-8 characters were found
  if (length(bad_cols) > 0) {
    message("Non-UTF-8 characters detected in columns: ",
            paste(bad_cols, collapse = ", "))
  } else {
    message("No non-UTF-8 characters found.")
  }
}

# Check the data for non-UTF-8 characters before conversion
check_utf8(data_in)

# Convert character columns from Latin1 encoding to UTF-8, removing problematic
#   characters
data_in[] <- lapply(data_in, function(x) {
  if (is.character(x)) {
    # Convert to UTF-8 and remove problematic characters
    iconv(x, from = "latin1", to = "UTF-8", sub = "")
  } else {
    x
  }
})

# Re-check the data for non-UTF-8 characters after the conversion
check_utf8(data_in)

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

# Display a chart for the number of households against type of toilet in use

# Filter out records with missing or empty 'toilet_facility_type'
# Then count the number of occurrences for each toilet type
toilet_data <- washmalawi %>%
  filter(!is.na(toilet_facility_type) & toilet_facility_type != "NA") %>%
  count(toilet_facility_type, sort = TRUE)

# Plotting the data ------------------------------------------------------------
# Create a horizontal bar chart showing the number of households
# using each type of toilet
ggplot(toilet_data, aes(x = reorder(toilet_facility_type, n), y = n)) +
  geom_bar(stat = "identity", fill = "#2C7BB6") +  # Use blue bars for counts
  coord_flip() +  # Flip axes to make the chart horizontal
  labs(
    title = "Distribution of Toilet Types in Surveyed Households",  # Chart title
    x = "Toilet Type",  # X-axis label (after flip, shows toilet types)
    y = "Number of Households"  # Y-axis label (number of entries)
  ) +
  theme_minimal(base_size = 13)
