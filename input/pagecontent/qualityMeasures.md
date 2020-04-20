This page describes how to measure the quality of certain variables in a FHIR server.

### Background

The [Quality Measure IG][1] describes electronic Clinical Quality Measures (eCQMs) which consist of the FHIR resources [Measure][2] and [Library][3]. With the help of the Measure resource, it's possible to formulate quality measures in an interoperable way. Compatible FHIR servers like [Blaze][4] implement the operation [$evaluate-measure][5] which allows a Measure to be evaluated. The result of a Measure evaluation is a [MeasureReport][6].

### Quality Measure Resources

The following 4 Measure and Library resources allow the generation of MeasureReports over certain important variables this IG cares about.

* [PatientQualityReports Measure](Measure-PatientQualityReports.html)
* [PatientQualityReports Library](Library-PatientQualityReports.html)
* [SpecimenQualityReports Measure](Measure-SpecimenQualityReports.html)
* [SpecimenQualityReports Library](Library-SpecimenQualityReports.html)

Currently you have to load this resources into Blaze manually. Tools like [Postman][10] make it easy to work with REST APIs.

### MeasureReport Generation

The MeasureReports can be generated either by using the FHIR REST API directly or using the [Blaze Quality Reporting UI][8]. The [Bridgehead Deployment][9] guide describes how to setup the UI locally.

#### Quality Reporting UI

The first step is to configure the FHIR server in the Quality Reporting UI under Settings. After that and after importing the Quality Measure resources, the Measures appear under Measures. Two Measures should be visible: the Patient Quality Reports and the Specimen Quality Reports. After you go in the measures sites, the button "Generate First Report" will generate the report.

[1]: <http://build.fhir.org/ig/HL7/cqf-measures/branches/R4_Lift/index.html>
[2]: <https://www.hl7.org/fhir/measure.html>
[3]: <https://www.hl7.org/fhir/library.html>
[4]: <https://github.com/samply/blaze>
[5]: <https://www.hl7.org/fhir/operation-measure-evaluate-measure.html>
[6]: <https://www.hl7.org/fhir/measurereport.html>
[7]: <https://github.com/samply/blazectl>
[8]: <https://github.com/samply/blaze-quality-reporting-ui>
[9]: <https://github.com/samply/bridgehead-deployment>
[10]: <https://www.postman.com>
