# CLAUDE.md

`washmalawi` is an openwashdata R data package with household-level WASH survey data from Malawi (2018 to 2023), with indicators for monitoring the WASH-related Sustainable Development Goals.

## Package facts

- Raw data: `data-raw/SDG Household Level Survey.csv`, which the processing script reads. `data-raw/SDG Household Level Survey (Malawi CJF).csv` is also in the repo; the script does not read it.
- Processing script: `data-raw/data_processing.R`. It writes `data/washmalawi.rda` and the CSV and XLSX exports in `inst/extdata/`.
- Data dictionary: `data-raw/dictionary.csv`.
- Branches: work and review PRs go to `dev`; `main` holds released versions.

## Reviews and releases

Reviews and releases follow the installed pkgreview skills. `/review-package` starts a review, `/review-issue` works through one review issue, `/create-release` makes a release and `/add-doi` adds the Zenodo DOI. The skills hold the steps and the current standards, so this file does not repeat them.
