#' SDG Household Level Survey - Malawi (2018 - 2023)
#' 
#' This dataset comprises household-level survey data collected across Malawi between 2018 and 2023 as part of a Sustainable Development Goals (SDG) monitoring initiative. 
#' The data captures detailed information on household water access, sanitation facilities, hygiene practices, and environmental conditions. 
#' It includes geolocation data (latitude, longitude, altitude), survey timestamps, and various indicators such as the availability of handwashing facilities, type of toilet 
#' used, and waste treatment methods. This dataset is instrumental for assessing progress in WASH (Water, Sanitation, and Hygiene) outcomes and guiding evidence-based 
#' interventions in underserved communities.
#' 
#' @format A tibble with 23112 rows and 27 variables
#' \describe{
#'   \item{date_submitted}{The date when the survey was submitted.}
#'   \item{latitude}{Latitude coordinate of the survey location.}
#'   \item{longitude}{Longitude coordinate of the survey location.}
#'   \item{water_point_identification_method}{Method used to identify the water point.}
#'   \item{traditional_authority}{Traditional authority area where the survey was conducted.}
#'   \item{district}{District where the survey was conducted.}
#'   \item{water_source_type}{Type of water source used (e.g., borehole, spring, piped).}
#'   \item{water_source_location}{Location of the water source relative to the dwelling.}
#'   \item{water_collection_time_mins}{Time in minutes to go there, get water, and come back.}
#'   \item{time_not_known}{Indicates if water collection time is not known.}
#'   \item{water_insufficiency_30days}{Whether there was insufficient water in the last 30 days.}
#'   \item{water_insufficiency_30days_not_known}{Indicates if water insufficiency information is not known.}
#'   \item{water_quality_tested}{Whether water quality was tested.}
#'   \item{bacteriological_test_done_at_location}{Location where bacteriological test was performed.}
#'   \item{parameters_tested_methods}{Parameters tested and methods used for water quality testing.}
#'   \item{chemical_quality_tested}{Whether chemical quality was tested.}
#'   \item{arsenic_tested_water}{Results of arsenic testing in water.}
#'   \item{fluoride_tested_water}{Results of fluoride testing in water.}
#'   \item{toilet_facility_type}{Type of toilet facility household members usually use.}
#'   \item{toilet_facility_shared}{Indicates if the toilet facility is shared with other households.}
#'   \item{waste_removed}{Whether human waste from this facility is removed periodically.}
#'   \item{waste_treated}{Indicates if the removed waste is treated.}
#'   \item{waste_disposal}{Method used to dispose of or treat human waste.}
#'   \item{handwash_available}{Whether a handwashing facility is available and its location.}
#'   \item{handwashing_water_presence}{Whether water was observed at the handwashing facility.}
#'   \item{handwashing_soap_presence}{Whether soap or detergent was observed at the handwashing facility.}
#'   \item{handwashing_supplies_available}{Whether the household currently has handwashing supplies available.}
#' }
"washmalawi"
