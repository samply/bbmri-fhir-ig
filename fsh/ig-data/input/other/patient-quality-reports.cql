library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem loinc: 'http://loinc.org'
codesystem icd10: 'http://hl7.org/fhir/sid/icd-10'
codesystem icd10Gm: 'http://fhir.de/CodeSystem/dimdi/icd-10-gm'

context Patient

define InInitialPopulation:
  true

define Age:
  AgeInYears()

define AgeBuckets:
  case
    when Age < 1 then '[0, 1)'
    when Age >= 1 and Age < 10 then '[1, 10)'
    when Age >= 10 and Age < 20 then '[10, 20)'
    when Age >= 20 and Age < 30 then '[20, 30)'
    when Age >= 30 and Age < 40 then '[30, 40)'
    when Age >= 40 and Age < 50 then '[40, 50)'
    when Age >= 50 and Age < 60 then '[50, 60)'
    when Age >= 60 and Age < 70 then '[60, 70)'
    when Age >= 70 and Age < 80 then '[70, 80)'
    when Age >= 80 and Age < 90 then '[80, 90)'
    when Age >= 90 and Age < 100 then '[90, 100)'
    else '[100, ∞)'
  end

define Gender:
  Patient.gender

define NumOfConditions:
  Count([Condition])

define ConditionBuckets:
  case
    when NumOfConditions = 0 then '0'
    when NumOfConditions between 1 and 9 then '[1, 10)'
    else '[10, ∞)'
  end

define NumOfBodyHeightObservations:
  Count([Observation: Code '8302-2' from loinc])

define BodyHeightObservationBuckets:
  case
    when NumOfBodyHeightObservations = 0 then '0'
    when NumOfBodyHeightObservations between 1 and 9 then '[1, 10)'
    else '[10, ∞)'
  end

define NumOfBodyWeightObservations:
  Count([Observation: Code '29463-7' from loinc])

define BodyWeightObservationBuckets:
  case
    when NumOfBodyWeightObservations = 0 then '0'
    when NumOfBodyWeightObservations between 1 and 9 then '[1, 10)'
    else '[10, ∞)'
  end

define NumOfBmiObservations:
  Count([Observation: Code '39156-5' from loinc])

define BmiObservationBuckets:
  case
    when NumOfBmiObservations = 0 then '0'
    when NumOfBmiObservations between 1 and 9 then '[1, 10)'
    else '[10, ∞)'
  end

define NumOfTobaccoUseObservations:
  Count([Observation: Code '72166-2' from loinc])

define TobaccoUseObservationBuckets:
  case
    when NumOfTobaccoUseObservations = 0 then '0'
    when NumOfTobaccoUseObservations between 1 and 9 then '[1, 10)'
    else '[10, ∞)'
  end

define NumOfSpecimens:
  Count([Specimen])

define SpecimenBuckets:
  case
    when NumOfSpecimens = 0 then '0'
    when NumOfSpecimens between 1 and 9 then '[1, 10)'
    else '[10, ∞)'
  end

define HasCovid19:
  exists([Condition: Code 'U07.1' from icd10]) or
  exists([Condition: Code 'U07.2' from icd10]) or
  exists([Condition: Code 'U07.1' from icd10Gm]) or
  exists([Condition: Code 'U07.2' from icd10Gm])
