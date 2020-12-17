Alias: $OrganizationDescription = https://fhir.bbmri.de/StructureDefinition/OrganizationDescription
Alias: $BioresourceReference = https://fhir.bbmri.de/StructureDefinition/BioresourceReference
Alias: $JuridicalPerson = https://fhir.bbmri.de/StructureDefinition/JuridicalPerson
Alias: $ITSupport = https://fhir.bbmri.de/StructureDefinition/ITSupport
Alias: $PartnerCharterSigned = https://fhir.bbmri.de/StructureDefinition/PartnerCharterSigned
Alias: $Collaboration = https://fhir.bbmri.de/StructureDefinition/Collaboration
Alias: $Capabilities = https://fhir.bbmri.de/StructureDefinition/Capabilities
Alias: $QualityStandard = https://fhir.bbmri.de/StructureDefinition/QualityStandard
Alias: $ContactRole = https://fhir.bbmri.de/StructureDefinition/ContactRole
Alias: $ParentCollection = https://fhir.bbmri.de/StructureDefinition/ParentCollection
Alias: $CollectionType = https://fhir.bbmri.de/StructureDefinition/CollectionType
Alias: $DataCategory = https://fhir.bbmri.de/StructureDefinition/DataCategory
Alias: $IdCard = https://fhir.bbmri.de/StructureDefinition/IdCard
Alias: $AccessPolicy = https://fhir.bbmri.de/StructureDefinition/AccessPolicy
Alias: $ResourceManagement = https://fhir.bbmri.de/StructureDefinition/ResourceManagement
Alias: $Geolocation = http://hl7.org/fhir/StructureDefinition/geolocation

Profile: Biobank
Parent: Organization
Id: Biobank
Title: "Biobank"
* extension contains
    $OrganizationDescription named description 1..1 MS and
    $BioresourceReference named bioresourceReference ..1 and
    $JuridicalPerson named juridicalPerson 1..1 MS and
    $ITSupport named itSupport ..1 and
    $PartnerCharterSigned named partnerCharterSigned ..1 and
    $Collaboration named collaboration ..1 and
    $Capabilities named capabilities 0..* and
    $QualityStandard named qualityStandard 0..* MS
* extension[bioresourceReference] ^short = "Bioresource reference"
* extension[bioresourceReference] ^definition = "Reference to be cited when the biobank is used for research"
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier contains Bbmri-EricId 1..1 MS
* identifier[Bbmri-EricId].system = "http://www.bbmri-eric.eu/" (exactly)
* identifier[Bbmri-EricId].system MS
* identifier[Bbmri-EricId].value MS
* identifier[Bbmri-EricId].value obeys bbmri-id-1
* identifier[Bbmri-EricId].value ^constraint[0].requirements = "Make sure valid BBMRI IDs are provided"
* name 1.. MS
* alias ..1 MS
* telecom ^slicing.discriminator[0].type = #value
* telecom ^slicing.discriminator[0].path = "system"
* telecom ^slicing.rules = #open
* telecom contains url 0..* MS
* telecom[url].system 1..
* telecom[url].system = #url (exactly)
* telecom[url].value 1..
* address 1..
* address.extension contains $Geolocation named geolocation 0..1
* address.country 1.. MS
* contact ^slicing.discriminator[0].type = #pattern
* contact ^slicing.discriminator[0].path = "purpose.coding"
* contact ^slicing.rules = #open
* contact contains
    head 1..1 MS and
    contact 1..1
* contact[head].extension contains $ContactRole named headRole ..1
* contact[head].extension[headRole] ^short = "Head role"
* contact[head].extension[headRole] ^definition = "Official role of the natural person in charge of the biobank: typically principal investigator or director"
* contact[head].purpose 1.. MS
* contact[head].purpose.coding = http://terminology.hl7.org/CodeSystem/contactentity-type#ADMIN
* contact[head].name 1..
* contact[head].name.family 1.. MS
* contact[head].name.given 1.. MS
* contact[head].name.prefix MS
* contact[head].name.suffix MS
* contact[contact].purpose 1.. MS
* contact[contact].purpose.coding = https://fhir.bbmri.de/CodeSystem/ContactType#RESEARCH
* contact[contact].name.family MS
* contact[contact].name.given MS
* contact[contact].name.prefix MS
* contact[contact].name.suffix MS
* contact[contact].telecom ^slicing.discriminator[0].type = #value
* contact[contact].telecom ^slicing.discriminator[0].path = "system"
* contact[contact].telecom ^slicing.rules = #open
* contact[contact].telecom contains phone 0..* MS and email 1..1 MS
* contact[contact].telecom[phone].system = #phone
* contact[contact].telecom[phone].system MS
* contact[contact].telecom[phone].value MS
* contact[contact].telecom[email].system = #email
* contact[contact].telecom[email].system MS
* contact[contact].telecom[email].value 1.. MS
* contact[contact].address 1..
* contact[contact].address.line MS
* contact[contact].address.city MS
* contact[contact].address.postalCode MS
* contact[contact].address.country 1.. MS

Profile: Collection
Parent: Organization
Id: Collection
Title: "Collection"
* obeys rd-card
* extension contains
    $OrganizationDescription named description 1..1 MS and
    $BioresourceReference named bioresourceReference ..1 and
    $ParentCollection named parentCollection ..1 and
    $CollectionType named collectionType 1.. MS and
    $DataCategory named dataCategory 1.. MS and
    $QualityStandard named quality 0..* and
    $IdCard named idCard ..1 and
    $AccessPolicy named accessPolicy 0..* and
    $Collaboration named collaboration ..1 and
    $ResourceManagement named resourceManagement 0..*
* extension[bioresourceReference] ^short = "Bioresource reference"
* extension[bioresourceReference] ^definition = "Reference to be cited when the collection is used for research"
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier contains Bbmri-EricId 1..1 MS
* identifier[Bbmri-EricId].system = "http://www.bbmri-eric.eu/" (exactly)
* identifier[Bbmri-EricId].system MS
* identifier[Bbmri-EricId].value MS
* identifier[Bbmri-EricId].value obeys bbmri-id-local
* name 1.. MS
* alias ..1 MS
* address.extension contains $Geolocation named geolocation 0..1
* partOf 1.. MS
* partOf only Reference(Biobank)
* partOf ^type[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy"
* partOf ^type[0].extension[0].valueBoolean = true
* contact ^slicing.discriminator[0].type = #pattern
* contact ^slicing.discriminator[0].path = "purpose.coding"
* contact ^slicing.rules = #open
* contact contains
    head ..1 MS and
    contact ..1 MS
* contact[head].extension contains $ContactRole named headRole ..1
* contact[head].extension[headRole] ^short = "Head role"
* contact[head].extension[headRole] ^definition = "Official role of the natural person in charge of the collection: typically principal investigator or director"
* contact[head].purpose 1.. MS
* contact[head].purpose.coding = http://terminology.hl7.org/CodeSystem/contactentity-type#ADMIN
* contact[head].name.family MS
* contact[head].name.given MS
* contact[head].name.prefix MS
* contact[head].name.suffix MS
* contact[contact].purpose 1.. MS
* contact[contact].purpose.coding = https://fhir.bbmri.de/CodeSystem/ContactType#RESEARCH
* contact[contact].name.family MS
* contact[contact].name.given MS
* contact[contact].name.prefix MS
* contact[contact].name.suffix MS
* contact[contact].telecom ^slicing.discriminator[0].type = #value
* contact[contact].telecom ^slicing.discriminator[0].path = "system"
* contact[contact].telecom ^slicing.rules = #open
* contact[contact].telecom contains phone 0..* MS and email 1..1 MS
* contact[contact].telecom[phone].system = #phone (exactly)
* contact[contact].telecom[phone].system MS
* contact[contact].telecom[phone].value MS
* contact[contact].telecom[email].system = #email (exactly)
* contact[contact].telecom[email].system MS
* contact[contact].telecom[email].value 1.. MS
* contact[contact].address.line MS
* contact[contact].address.city MS
* contact[contact].address.postalCode MS
* contact[contact].address.country 1.. MS

Invariant: bbmri-id-1
Description: "bbmri-eric:ID:<CC>_<local id>: SHALL contain the bbmri-eric prefix followed by valid ISO-3166-1 alpha 2 country code followed by _ followed by biobank ID of national registry (if present)."
Severity: #warning
Expression: "matches('^bbmri-eric:ID:([A-Z]){2}_([a-zA-Z0-9])+$')"

Invariant: rd-card
Description: "If extension:idCard is present, there SHALL be at least one extension:collectionType where value is RD (Rare Disease)."
Severity: #error
Expression: "extension.where(url = 'https://fhir.bbmri.de/StructureDefinition/IdCard').exists() implies extension.where(url='https://fhir.bbmri.de/StructureDefinition/CollectionType').where(value.coding.where(code = 'RD').where(system='https://fhir.bbmri.de/CodeSystem/CollectionType').exists()).exists()"

Invariant: bbmri-id-local
Description: "Shall contain the biobank ID followed by the local collection id."
Severity: #warning
Expression: "matches('^bbmri-eric:ID:([A-Z]){2}_([a-zA-Z0-9])+:collection:([a-zA-Z0-9])+$')"