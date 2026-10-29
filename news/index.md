# Changelog

## washmalawi 1.0.1

- Minor release to enable Zenodo DOI generation
- No functional changes from v1.0.0

## washmalawi 1.0.0

### Major improvements

- Added complete package documentation and metadata
  ([\#1](https://github.com/openwashdata/washmalawi/issues/1))
  - Created CITATION.cff with full citation information
  - Added inst/CITATION for R citation support
  - Updated DESCRIPTION file with complete metadata
- Enhanced data quality and documentation
  ([\#2](https://github.com/openwashdata/washmalawi/issues/2))
  - Improved R documentation with clearer descriptions
  - Validated data integrity and quality
- Streamlined data processing pipeline
  ([\#3](https://github.com/openwashdata/washmalawi/issues/3))
  - Simplified and optimized data-raw/data_processing.R
  - Made processing more efficient and maintainable
- Built comprehensive documentation website
  ([\#4](https://github.com/openwashdata/washmalawi/issues/4))
  - Added pkgdown configuration with analytics
  - Created complete README with installation instructions
  - Built full documentation website at
    <https://openwashdata.github.io/washmalawi/>
- Implemented automated testing and CI/CD
  ([\#5](https://github.com/openwashdata/washmalawi/issues/5))
  - Added GitHub Actions for R CMD check
  - Created unit tests for package functionality
  - Configured continuous integration pipeline

### Initial features

- Dataset containing water point status information across Traditional
  Authorities in Malawi
- 117 observations with 7 variables including functionality status by
  authority
- Multiple export formats (R, CSV, XLSX)
- Complete variable dictionary and metadata
