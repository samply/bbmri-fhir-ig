# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.0] - 2019-10-23
### Added
- New code for uspecified tumor
- Documentation for validator
- Documentation on how to deal with references in Bundles
### Changed
- FHIR version is now 4.0.1
- Adapted SampleDiagnosis extension to support multiple ICD versions. ICD slices are now only defined by their system URL, non-ICD codes are defined by a ValueSet "OtherSampleDiagnosis" (replaces "SampleDiagnosis"). 
- In example Bundle: fullUrls are now absolute URLs in accordance to the FHIR spec.

[Unreleased]: https://github.com/samply/bbmri-fhir-ig/compare/v0.1.0...HEAD
[0.0.1]: https://github.com/samply/bbmri-fhir-ig/releases/tag/v0.1.0
