Extension: SampleDiagnosis
Id: SampleDiagnosis
Title: "Sample Diagnosis"
* ^context.type = #element
* ^context.expression = "Specimen"
* value[x] 1..
* value[x] only CodeableConcept
* value[x] obeys slicing-1
* value[x].coding 1..
* value[x].coding ^slicing.discriminator[0].type = #value
* value[x].coding ^slicing.discriminator[0].path = "system"
* value[x].coding ^slicing.discriminator[1].type = #value
* value[x].coding ^slicing.discriminator[1].path = "version"
* value[x].coding ^slicing.discriminator[2].type = #value
* value[x].coding ^slicing.discriminator[2].path = "$this"
* value[x].coding ^slicing.rules = #closed
* value[x].coding contains icd-10-who 0..* and icd-10-gm 0..* and icd-9 0..* and no-icd 0..*
* value[x].coding[icd-10-who].system 1..
* value[x].coding[icd-10-who].system = "http://hl7.org/fhir/sid/icd-10" (exactly)
* value[x].coding[icd-10-who].code 1..
* value[x].coding[icd-10-gm].system 1..
* value[x].coding[icd-10-gm].system = "http://fhir.de/CodeSystem/dimdi/icd-10-gm" (exactly)
* value[x].coding[icd-10-gm].code 1..
* value[x].coding[icd-9].system 1..
* value[x].coding[icd-9].system = "http://hl7.org/fhir/sid/icd-9" (exactly)
* value[x].coding[icd-9].code 1..
* value[x].coding[no-icd] from OtherSampleDiagnosis (required)
* value[x].coding[no-icd].system 1..
* value[x].coding[no-icd].code 1..

Invariant: slicing-1
Description: "When slice no-icd is present, the other slices must not be present"
Severity: #error
Expression: "$this.coding.where(system='https://fhir.bbmri.de/CodeSystem/OtherSampleDiagnosis').exists().not() or ($this.coding.where(system='http://hl7.org/fhir/sid/icd-10').exists() or $this.coding.where(system='http://fhir.de/CodeSystem/dimdi/icd-10-gm').exists() or $this.coding.where(system='http://hl7.org/fhir/sid/icd-9').exists()).not()"