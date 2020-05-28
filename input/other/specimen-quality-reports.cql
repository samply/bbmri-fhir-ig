library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

context Specimen

define InInitialPopulation:
  true

define FirstSampleMaterialType:
  First(from Specimen.type.coding C
    where C.system = 'https://fhir.bbmri.de/CodeSystem/SampleMaterialType'
    return C.code)

define NumberOfSampleMaterialTypes:
  Count(from Specimen.type.coding C
    where C.system = 'https://fhir.bbmri.de/CodeSystem/SampleMaterialType'
    return C.code)

define CollectedYear:
  year from FHIRHelpers.ToDateTime(Specimen.collection.collected)

define CollectedMonth:
  month from FHIRHelpers.ToDateTime(Specimen.collection.collected)

define CollectedDay:
  day from FHIRHelpers.ToDateTime(Specimen.collection.collected)

define CollectedHour:
  hour from FHIRHelpers.ToDateTime(Specimen.collection.collected)

define StorageTemperatureCodings:
  flatten
    from Specimen.extension E
      where E.url = 'https://fhir.bbmri.de/StructureDefinition/StorageTemperature'
      return E.value.coding

define StorageTemperatureCodes:
  Combine(from StorageTemperatureCodings C
    where C.system = 'https://fhir.bbmri.de/CodeSystem/StorageTemperature'
    return C.code, ', ')

define NumberOfStorageTemperatureCodes:
  Count(from StorageTemperatureCodings C
    where C.system = 'https://fhir.bbmri.de/CodeSystem/StorageTemperature')

define SampleDiagnosisCodings:
  flatten
    from Specimen.extension E
    where E.url = 'https://fhir.bbmri.de/StructureDefinition/SampleDiagnosis'
    return E.value.coding

define SampleDiagnosisICD10Codes:
  Combine(from SampleDiagnosisCodings C
    where C.system = 'http://hl7.org/fhir/sid/icd-10'
    return C.code, ', ')

define NumberOfSampleDiagnosesICD10Codes:
  Count(from SampleDiagnosisCodings C
    where C.system = 'http://hl7.org/fhir/sid/icd-10')

define SampleDiagnosisICD10GMCodes:
  Combine(from SampleDiagnosisCodings C
    where C.system = 'http://fhir.de/CodeSystem/dimdi/icd-10-gm'
    return C.code, ', ')

define NumberOfSampleDiagnosesICD10GMCodes:
  Count(from SampleDiagnosisCodings C
    where C.system = 'http://fhir.de/CodeSystem/dimdi/icd-10-gm')

define BodySiteCodes:
  Combine(from Specimen.collection.bodySite.coding C
    where C.system = 'urn:oid:1.3.6.1.4.1.19376.1.3.11.36'
    return C.code, ', ')

define NumberOfBodySiteCodes:
  Count(from Specimen.collection.bodySite.coding C
    where C.system = 'urn:oid:1.3.6.1.4.1.19376.1.3.11.36')
