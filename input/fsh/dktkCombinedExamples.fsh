Instance: gba-dktk-patient
InstanceOf: Patient
Title: "Donor and DKTK Patient Example"
Usage: #example

* meta.profile = "http://dktk.dkfz.de/fhir/StructureDefinition/onco-core-Patient-Pseudonym"
* meta.profile[1] = "https://fhir.bbmri.de/StructureDefinition/Patient"

* identifier.type = http://dktk.dkfz.de/fhir/onco/core/CodeSystem/PseudonymArtCS#Lokal "Lokal"
* identifier.use = #secondary
* identifier.system = "http://fhir.biobank.uk-musterstadt.de/NamingSystem/localPseud"
* identifier.value = "432wrtjiuzrmneb65264bi"

* gender = #female
* birthDate = "1956-03"

Instance: cancer-diag
InstanceOf: Condition
Title: "Krebsdiagnose nach DKTK"
Usage: #example

* meta.profile = "http://dktk.dkfz.de/fhir/StructureDefinition/onco-core-Condition-Primaerdiagnose"
* meta.profile[1] = "https://fhir.bbmri.de/StructureDefinition/Condition"

* code.coding.system = "http://fhir.de/CodeSystem/dimdi/icd-10-gm"
* code.coding.version = "2018"
* code.coding.code = #C43.6
* code.coding.display = "Bösartiges Melanom der oberen Extremität, einschließlich Schulter"

* bodySite.coding.system = "urn:oid:1.3.6.1.4.1.19376.1.3.11.36"
* bodySite.coding.version = "32"
* bodySite.coding.code = #C44.6
* bodySite.coding.display = "Haut der oberen Extremitäten und der Schulter"

* subject = Reference(gba-dktk-patient)

* recordedDate = "2018-04-15"

* evidence.detail = Reference(dktk-histo)

Instance: dktk-histo
InstanceOf: Observation
Title: "Histologie"
Usage: #example

* meta.profile = "http://dktk.dkfz.de/fhir/StructureDefinition/onco-core-Observation-Histologie"
* status = #final
* code = http://loinc.org#59847-4 "Histology and Behavior ICD-O-3 Cancer"
* subject = Reference(gba-dktk-patient)
* effectiveDateTime = "2018-04-14T14:30:00+01:00"
* valueCodeableConcept.coding.system = "urn:oid:2.16.840.1.113883.6.43.1"
* valueCodeableConcept.coding.version = "32"
* valueCodeableConcept.coding.code = #8720/2
* valueCodeableConcept.coding.display = "Melanoma in situ"
* specimen = Reference(gba-dktk-specimen)

Instance: gba-dktk-specimen
InstanceOf: Specimen
Title: "Bioprobe Melanom"
Usage: #example

* meta.profile = "https://fhir.bbmri.de/StructureDefinition/Specimen"

* extension[0].url = "https://fhir.bbmri.de/StructureDefinition/StorageTemperature"
* extension[0].valueCodeableConcept = https://fhir.bbmri.de/CodeSystem/StorageTemperature#temperature-18to-35 "Degrees Celsius -18 to -35"

* extension[1].url = "https://fhir.bbmri.de/StructureDefinition/SampleDiagnosis"
* extension[1].valueCodeableConcept = http://fhir.de/CodeSystem/dimdi/icd-10-gm#C43.6 "Bösartiges Melanom der oberen Extremität, einschließlich Schulter"

* extension[2].url = "https://fhir.bbmri.de/StructureDefinition/Custodian"
* extension[2].valueReference.reference = "Organization/exampleCollection"

* type = https://fhir.bbmri.de/CodeSystem/SampleMaterialType#tumor-tissue-frozen "Tumor tissue (frozen)"

* subject = Reference(gba-dktk-patient)

* collection.collectedDateTime = "2018-04-14T14:30:00+01:00"
* collection.bodySite.coding.system = "urn:oid:1.3.6.1.4.1.19376.1.3.11.36"
* collection.bodySite.coding.version = "32"
* collection.bodySite.coding.code = #C44.6
* collection.bodySite.coding.display = "Haut der oberen Extremitäten und der Schulter"
* collection.fastingStatusCodeableConcept = http://terminology.hl7.org/CodeSystem/v2-0916#FNA "Fasting not asked of the patient at time of procedure."
