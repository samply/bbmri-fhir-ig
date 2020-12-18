Alias: $OtherSampleDiagnosis = https://fhir.bbmri.de/ValueSet/OtherSampleDiagnosis

Extension: SampleDiagnosis
Id: SampleDiagnosis
Title: "Sample Diagnosis"
* ^context[0].type = #element
* ^context[0].expression = "Specimen"
* value[x] 1..
* value[x] only CodeableConcept
* valueCodeableConcept obeys icd-xor-other-code
* valueCodeableConcept.coding 1..
* valueCodeableConcept.coding ^slicing.discriminator[0].type = #value
* valueCodeableConcept.coding ^slicing.discriminator[0].path = "system"
* valueCodeableConcept.coding ^slicing.discriminator[1].type = #value
* valueCodeableConcept.coding ^slicing.discriminator[1].path = "version"
* valueCodeableConcept.coding ^slicing.discriminator[2].type = #value
* valueCodeableConcept.coding ^slicing.discriminator[2].path = "$this"
* valueCodeableConcept.coding ^slicing.rules = #open

* valueCodeableConcept.coding contains icd-10-who 0..* and icd-10-gm 0..* and icd-9 0..* and no-icd 0..*

* valueCodeableConcept.coding[icd-10-who].system 1..
* valueCodeableConcept.coding[icd-10-who].system = "http://hl7.org/fhir/sid/icd-10" (exactly)
* valueCodeableConcept.coding[icd-10-who].code 1..
* valueCodeableConcept.coding[icd-10-gm].system 1..
* valueCodeableConcept.coding[icd-10-gm].system = "http://fhir.de/CodeSystem/dimdi/icd-10-gm" (exactly)
* valueCodeableConcept.coding[icd-10-gm].code 1..
* valueCodeableConcept.coding[icd-9].system 1..
* valueCodeableConcept.coding[icd-9].system = "http://hl7.org/fhir/sid/icd-9" (exactly)
* valueCodeableConcept.coding[icd-9].code 1..
* valueCodeableConcept.coding[no-icd] from $OtherSampleDiagnosis (required)
* valueCodeableConcept.coding[no-icd].system 1..
* valueCodeableConcept.coding[no-icd].code 1..

Invariant: icd-xor-other-code
Description: "When slice no-icd is present, the other slices must not be present"
Severity: #error
Expression: "coding.where(system='https://fhir.bbmri.de/CodeSystem/OtherSampleDiagnosis').exists() xor coding.where(system='http://hl7.org/fhir/sid/icd-10' or system='http://fhir.de/CodeSystem/dimdi/icd-10-gm' or system='http://hl7.org/fhir/sid/icd-9').exists()"
