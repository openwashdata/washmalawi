# SDG Household Level Survey - Malawi (2018 - 2023)

This dataset comprises household-level survey data collected across
Malawi between 2018 and 2023 as part of a Sustainable Development Goals
(SDG) monitoring initiative. The data captures detailed information on
household water access, sanitation facilities, hygiene practices, and
environmental conditions. It includes geolocation data (latitude,
longitude, altitude), survey timestamps, and various indicators such as
the availability of handwashing facilities, type of toilet used, and
waste treatment methods. This dataset is instrumental for assessing
progress in WASH (Water, Sanitation, and Hygiene) outcomes and guiding
evidence-based interventions in underserved communities.

## Usage

``` r
washmalawi
```

## Format

A tibble with 23112 rows and 27 variables

- date_submitted:

  The date when the survey was submitted.

- latitude:

  Latitude coordinate of the survey location.

- longitude:

  Longitude coordinate of the survey location.

- water_point_identification_method:

  Method used to identify the water point.

- traditional_authority:

  Traditional authority area where the survey was conducted.

- district:

  District where the survey was conducted.

- water_source_type:

  Type of water source used (e.g., borehole, spring, piped).

- water_source_location:

  Location of the water source relative to the dwelling.

- water_collection_time_mins:

  Time in minutes to go there, get water, and come back.

- time_not_known:

  Indicates if water collection time is not known.

- water_insufficiency_30days:

  Whether there was insufficient water in the last 30 days.

- water_insufficiency_30days_not_known:

  Indicates if water insufficiency information is not known.

- water_quality_tested:

  Whether water quality was tested.

- bacteriological_test_done_at_location:

  Location where bacteriological test was performed.

- parameters_tested_methods:

  Parameters tested and methods used for water quality testing.

- chemical_quality_tested:

  Whether chemical quality was tested.

- arsenic_tested_water:

  Results of arsenic testing in water.

- fluoride_tested_water:

  Results of fluoride testing in water.

- toilet_facility_type:

  Type of toilet facility household members usually use.

- toilet_facility_shared:

  Indicates if the toilet facility is shared with other households.

- waste_removed:

  Whether human waste from this facility is removed periodically.

- waste_treated:

  Indicates if the removed waste is treated.

- waste_disposal:

  Method used to dispose of or treat human waste.

- handwash_available:

  Whether a handwashing facility is available and its location.

- handwashing_water_presence:

  Whether water was observed at the handwashing facility.

- handwashing_soap_presence:

  Whether soap or detergent was observed at the handwashing facility.

- handwashing_supplies_available:

  Whether the household currently has handwashing supplies available.
