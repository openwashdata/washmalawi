test_that("washmalawi data loads correctly", {
  # Test that the dataset exists and can be loaded
  expect_true(exists("washmalawi"))
  
  # Test that it's a data frame (or tibble)
  expect_s3_class(washmalawi, "data.frame")
})

test_that("washmalawi has expected dimensions", {
  # Test number of rows
  expect_equal(nrow(washmalawi), 23112)
  
  # Test number of columns
  expect_equal(ncol(washmalawi), 27)
})

test_that("washmalawi has expected column names", {
  expected_names <- c(
    "date_submitted", "latitude", "longitude", 
    "water_point_identification_method", "traditional_authority", 
    "district", "water_source_type", "water_source_location",
    "water_collection_time_mins", "time_not_known",
    "water_insufficiency_30days", "water_insufficiency_30days_not_known",
    "water_quality_tested", "bacteriological_test_done_at_location",
    "parameters_tested_methods", "chemical_quality_tested",
    "arsenic_tested_water", "fluoride_tested_water",
    "toilet_facility_type", "toilet_facility_shared",
    "waste_removed", "waste_treated", "waste_disposal",
    "handwash_available", "handwashing_water_presence",
    "handwashing_soap_presence", "handwashing_supplies_available"
  )
  
  expect_equal(names(washmalawi), expected_names)
})

test_that("washmalawi data types are correct", {
  # Test numeric columns
  expect_type(washmalawi$latitude, "double")
  expect_type(washmalawi$longitude, "double")
  expect_type(washmalawi$water_collection_time_mins, "double")
  
  # Test character columns
  expect_type(washmalawi$date_submitted, "character")
  expect_type(washmalawi$district, "character")
  expect_type(washmalawi$water_source_type, "character")
  
  # Test logical columns
  expect_type(washmalawi$time_not_known, "logical")
})

test_that("washmalawi coordinate values are reasonable for Malawi", {
  # Malawi's approximate bounds
  # Latitude: -17.13 to -9.37
  # Longitude: 32.67 to 35.92
  
  expect_true(all(washmalawi$latitude >= -17.5 & washmalawi$latitude <= -9))
  expect_true(all(washmalawi$longitude >= 32 & washmalawi$longitude <= 36.5))
})