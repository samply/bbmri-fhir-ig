This section lists the profiles defined in this IG and briefly highlights important aspects. Fields marked with *mustSupport* are used by the queries and shall be filled if the information is available. Information from other fields may used in future versions and can be provided optionally.

![Overview profiles](GBA-DatamodellFHIR_V05.png)

### [Biobank](StructureDefinition-Biobank.html)
A Biobank. Designed to contain all information necessary to populate a BBMRI Directory biobank entry, see Mappings page. Note that two contact slices exist, one for the biobank head (which only requires a name and no actual contact information) and one for the actual endpoint researches should contact for inquiries about data and samples (which requires an email address and a county, but does not require a name, although it should be provided where available). 

### [Collection](StructureDefinition-Collection.html)
A Collection within a Biobank. Designed to contain all information necessary to populate a BBMRI Directory collection entry, see Mappings page. The contact is structured as described in the Biobank section.

### [NetworkMembership](StructureDefinition-NetworkMembership.html)
Used to describe a Biobank's membership in a Biobank Network (used to fill the BBMRI directory). The biobank is the *participatingOrganization* and should be referenced as a FHIR resource, the *organization* is the network and can be referenced without creating a FHIR resource by using its BBMRI ID in the *reference.identifier* field.

### [Patient](StructureDefinition-Patient.html)
The birth date may be truncated to year in order to provide anonymity. While gender is defined in FHIR as the administrative gender, in some contexts this may contain/be read as the biological sex. Since most Biobanks only store a single value anyway, we do not differentiate between aspects of sex/gender, for more information see https://www.hl7.org/fhir/patient.html#gender. For deceased patients, *deceased* shall contain the date and time of death, although the precision may vary, e.g. only a date may be provided.

### [CauseOfDeath](StructureDefinition-CauseOfDeath.html)
This resource captures the ICD-10 coded cause of death for deceased patients.

### [TobaccoUse](StructureDefinition-TobaccoUse.html)
TobaccoUse captures the smoking status of a patient at a given time. While the time of observation should be provided in *effective*, this field may be empty if no such information is available, although this highly reduces the value of this information since it can no longer be sufficiently linked to a specific sample.

### [Condition](StructureDefinition-Condition.html)
Contains an ICD-10 coded diagnosis for a patient. If possible, the onset date should be documented in *onset*. If only the system entry time is provided, it should be stored in *recordedDate* and will be used as a substitute. Systems may also populate the *abatement* field which will allow researches advanced temporal queries in future releases.

### [BMI](StructureDefinition-Bmi.html), [BodyHeight](StructureDefinition-BodyHeight.html) and [BodyWeight](StructureDefinition-BodyWeight.html)
BodyHeight and BodyWeight may be used to calculate the appropriate value for BMI, although currently no validation of this calculation takes place. While the time of observation should be provided in *effective*, this field may be empty if no such information is available, although this highly reduces the value of this information since it can no longer be sufficiently linked to a specific sample.

### [Specimen](StructureDefinition-Specimen.html)
Contains information related to a sample.
