library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem icd10: 'http://hl7.org/fhir/sid/icd-10'
codesystem icd10Gm: 'http://fhir.de/CodeSystem/dimdi/icd-10-gm'

context Patient

define InInitialPopulation:
  true

define AgeClass:
  (AgeInYears() div 10) * 10

define Gender:
  Patient.gender

define HasCovid19:
  exists([Condition: Code 'U07.1' from icd10]) or
  exists([Condition: Code 'U07.2' from icd10]) or
  exists([Condition: Code 'U07.1' from icd10Gm]) or
  exists([Condition: Code 'U07.2' from icd10Gm])
