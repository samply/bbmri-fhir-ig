Profile:        TobaccoUse
Parent:         Observation
Id:             TobaccoUse
Title:          "TobaccoUse"
Description:    "Tobacco use"

// Define Must Support fields
* subject and effective[x] and value[x] MS

* code.coding = http://loinc.org#72166-2

* subject 1..1
* subject.reference 1..1

//Effective is not 1..1 even though it is required in IPS, transformations could use absent-reason extension.
* effective[x] only dateTime

* value[x] only CodeableConcept
* valueCodeableConcept from http://hl7.org/fhir/uv/ips/ValueSet/current-smoking-status-uv-ips (required)

//Remove component for IPS compatibility
* component 0..0
