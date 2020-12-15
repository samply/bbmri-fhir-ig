This section describes how the profiles defined in this guide relate to several other data models, mainly from other biobank-related projects. Partial paths in *italic* imply slice names.

### BBMRI-ERIC  Directory
The BBMRI-ERIC Directory can be found [here](https://directory.bbmri-eric.eu).

#### Biobank
The BBMRI-ERIC Directory *Biobank* entity corresponds to the *Biobank* profile from this guide.

| BBMRI-ERIC | Biobank Profile |
|--|--|
|id | identifier:*Bbmri-EricId*.value |
|name | name |
|acronym | alias |
|description | extension:*description*.value |
|bioresource_reference | extension:*bioresourceReference*.value |
|url | telecom:*url*.value|
|juridical_person | extension:*juridicalPerson*.value |
|country | address.country |
|it_support_available | extension:*itSupport*.extension:*itSupportAvailable*.value |
|it_staff_size | extension:*itSupport*.extension:*itStaffSize*.value|
|is_available | extension:*itSupport*.extension:*isAvailable*.value |
|his_available | extension:*itSupport*.extension:*hisAvailable*.value
|partner_charter_signed | extension:*partnerCharterSigned*.value |
|head_title_before_name | contact:*head*.name.prefix |
|head_firstname | contact:*head*.name.given |
|head_lastname | contact:*head*.name.family |
|head_title_after_name | contact:*head*.name.suffix |
|head_role | contact:*head*.extension:*role*.value |
|contact | *see section contact* |
|latitude | address.extension:*geolocation*.extension:*latitude* |
|longitude | address.extension:*geolocation*.extension:*longitude* |
|network | *see section network* |
|collaboration_commercial | extension:*collaboration*.extension:*commercial*.value|
|collaboration_non_for_profit | extension:*collaboration*.extension:*nonForProfit*.value|
|capabilities | extension:*capabilities*.value |
|quality | extension:*qualityStandards*.value |

#### Contact Information
In FHIR, the contact information is included in the [*Organization* resource][1], which is profiled as *Biobank* in this guide.

| BBMRI-ERIC| Biobank.contact |
|--|--|
| title_before_name |  prefix |
|first_name | given |
|last_name | family |
|title_after_name | suffix |
| phone | contact:*contact*.telecom:*phone*.value |
|email | contact:*contact*.telecom:*email*.value |
|address | contact:*contact*.address.line |
|zip | contact:*contact*.address.postalCode |
|city | contact:*contact*.address.city |
|country | contact:*contact*.address.country |

#### Collection
The BBMRI-ERIC Directory *Collection* entity corresponds to the *Collection* profile from this guide. Like *Biobank*, it is based on the *Organization* resource but has different constraints.

| BBMRI-ERIC| Collection |
|--|--|
|id | identifier:*Bbmri-EricId*.value |
|country | contact:_contact_.address.country *(If not present, biobank country is used)*|
|biobank | partOf|
|name | name |
|acronym | alias |
|description | extension.description.value |
|bioresource_reference | extension:*bioresourceReference*.value |
|parent_collection | *via OrganizationAffiliation(TODO)* |
|network | *see section network* |
|type | extension:*collectionType*.value |
|data_categories | extension:*dataCategory*.value|
|quality | extension:*qualityStandards*.value |
|order_of_magnitude | *calculated on-the-fly from bridgehead data* |
|order_of_magnitude_donors | *calculated on-the-fly from bridgehead data* |
|size | *calculated on-the-fly from bridgehead data* |
|number_of_donors | *calculated on-the-fly from bridgehead data* |
|timestamp | *calculated on-the-fly from bridgehead data* |
|id_card | extension:*idCard*.value |
|head_title_before_name | contact:*head*.name.prefix |
|head_firstname | contact:*head*.name.given |
|head_lastname | contact:*head*.name.family |
|head_title_after_name | contact:*head*.name.suffix |
|head_role | contact:*head*.extension:*role*.value |
|contact | *see section contact* |
|latitude | address.extension:*geolocation*.extension:*latitude* |
|longitude | address.extension:*geolocation*.extension:*longitude* |
|sex| *calculated on-the-fly from bridgehead data* |
|diagnosis_available| *calculated on-the-fly from bridgehead data* |
|age Low| *calculated on-the-fly from bridgehead data* | 
|age High| *calculated on-the-fly from bridgehead data* | 
|age Unit| *calculated on-the-fly from bridgehead data* | 
|body_part_examined| *calculated on-the-fly from bridgehead data (once available)* | 
|imaging_modality| *calculated on-the-fly from bridgehead data (once available)* | 
|image_dataset_type| *calculated on-the-fly from bridgehead data (once available)* | 
|materials| *calculated on-the-fly from bridgehead data* |
|storage_temperature| *calculated on-the-fly from bridgehead data* |
|sample_access_fee | extension:*accessPolicy*.extension:*fee*.value (when  extension:*accessPolicy*.extension:*resource*.value = "sample") |
|sample_access_joint_project | extension:*accessPolicy*.extension:*jointProject*.value (when  extension:*accessPolicy*.extension:*resource*.value = "sample") |
|sample_access_description | extension:*accessPolicy*.extension:*description*.value (when  extension:*accessPolicy*.extension:*resource*.value = "sample") |
|sample_access_uri | extension:*accessPolicy*.extension:*uri*.value (when  extension:*accessPolicy*.extension:*resource*.value = "sample") |
|data_access_fee | extension:*accessPolicy*.extension:*fee*.value (when  extension:*accessPolicy*.extension:*resource*.value = "data") |
|data_access_joint_project | extension:*accessPolicy*.extension:*jointProject*.value (when  extension:*accessPolicy*.extension:*resource*.value = "data") |
|data_access_description | extension:*accessPolicy*.extension:*description*.value (when  extension:*accessPolicy*.extension:*resource*.value = "data") |
|data_access_uri | extension:*accessPolicy*.extension:*uri*.value (when  extension:*accessPolicy*.extension:*resource*.value = "data") |
|image_access_fee | extension:*accessPolicy*.extension:*fee*.value (when  extension:*accessPolicy*.extension:*resource*.value = "image") |
|image_access_joint_project | extension:*accessPolicy*.extension:*jointProject*.value (when  extension:*accessPolicy*.extension:*resource*.value = "image") |
|image_access_description | extension:*accessPolicy*.extension:*description*.value (when  extension:*accessPolicy*.extension:*resource*.value = "image") |
|image_access_uri | extension:*accessPolicy*.extension:*uri*.value (when  extension:*accessPolicy*.extension:*resource*.value = "image") |
|collaboration_commercial | extension:*collaboration*.extension:*commercial*.value|
|collaboration_non_for_profit | extension:*collaboration*.extension:*nonForProfit*.value|
|sample_processing_sop | extension:*resourceManagement*.extension:*processingSop*.value (when  extension:*resourceManagement*.extension:*resource*.value = "sample") |
|sample_transport_sop | extension:*resourceManagement*.extension:*transportSop*.value (when  extension:*resourceManagement*.extension:*resource*.value = "sample") |
|sample_storage_sop | extension:*resourceManagement*.extension:*storageSop*.value (when  extension:*resourceManagement*.extension:*resource*.value = "sample") |
|data_processing_sop | extension:*resourceManagement*.extension:*processingSop*.value (when  extension:*resourceManagement*.extension:*resource*.value = "data") |
|data_transport_sop | extension:*resourceManagement*.extension:*transportSop*.value (when  extension:*resourceManagement*.extension:*resource*.value = "data") |
|data_storage_sop | extension:*resourceManagement*.extension:*storageSop*.value (when  extension:*resourceManagement*.extension:*resource*.value = "data") |



#### Network
This project does not contain a specific profile for biobank networks. While such networks could be represented as [*Organization* resources][1], it is outside the scope for this project.
 To record a biobank's membership in a network, we use a profiled *OrganizationAffiliation*: *NetworkMembership*. There, the reference to the network happens via its BBMRI Directory id since we do not have an actual FHIR resource.

### [MIABIS](https://github.com/MIABIS/miabis/wiki)

#### Biobank

The information for a MIABIS Biobank is found in the Biobank profile.

| MIABIS Attribute Code | Name | FHIR |
|--|--|--|
| MIABIS-2.0-01 | ID | identifier |
| MIABIS-2.0-02 | Acronym | alias |
| MIABIS-2.0-03 | Name | Text | name |
| MIABIS-2.0-04 | URL | Text | telecom:*url*.value |
| MIABIS-2.0-05 | Juristic Person | extension:*juridicalPerson*.value |
| MIABIS-2.0-06 | Country |  address.country |
| MIABIS-2.0-07 | Contact Information | See section contact |
| MIABIS-2.0-08 | Description | extension:*description*.value |

#### Collection

Corresponds to Collection profile

| MIABIS Attribute Code| Name | FHIR |
|--|--|--|
| MIABIS-2.0-01| ID| identifier | 
| MIABIS-2.0-02| Acronym| alias | 
| MIABIS-2.0-03| Name| name| 
| MIABIS-2.0-08| Description| extension.description.value | 
| MIABIS-2.0-09| Sex| *calculated on-the-fly from bridgehead data* |
| MIABIS-2.0-10| Age Low| *calculated on-the-fly from bridgehead data* | 
| MIABIS-2.0-11| Age High| *calculated on-the-fly from bridgehead data* | 
| MIABIS-2.0-12| Age Unit| *calculated on-the-fly from bridgehead data* | 
| MIABIS-2.0-13| Data categories| extension:*dataCategory* |
| MIABIS-2.0-14| Material type| *calculated on-the-fly from bridgehead data* | 
| MIABIS-2.0-15| Storage temperature| *calculated on-the-fly from bridgehead data*| 
| MIABIS-2.0-16| Collection type| extension:*collectionType*.value | 
| MIABIS-2.0-17| Disease| *not supported* |
| MIABIS-2.0-07| Contact information| See section contact | 

#### Contact MIABIS-2.0-07

The contact information can be stored in the *contact* fields of Collection or Biobank which already specify two slices for the *head* and the research *contact* with slices on telecom to model phone and mail contact points.
We currently do not support the *researcher information* type.

| Attribute Code| Attribute Name | FHIR |
|--|--|--|
| MIABIS-2.0-07-A| First name| name.given |
| MIABIS-2.0-07-B| Last name| name.family |
| MIABIS-2.0-07-C| Phone| telecom:*phone*.value |
| MIABIS-2.0-07-D| Email| telecom:*email*.value |
| MIABIS-2.0-07-E| Address| address.line |
| MIABIS-2.0-07-F| ZIP| address.postalCode |
| MIABIS-2.0-07-G| City| address.city |
| MIABIS-2.0-07-H| Country| address.country | 

#### Sample

Corresponds to the specimen profile.

| Attribute Code| Attribute Name| FHIR|
|--|--|--|
| MIABIS-SAMPLE-01| Sample ID| *no internal IDs supported, identification via resource id* |
| MIABIS-SAMPLE-02| Detailed material type| type (not yet mapped to MIABIS types) |
| MIABIS-SAMPLE-03| Sample storage temperature| extension:*storageTemperature* |
| MIABIS-SAMPLE-04| Sample creation date and time| collection.collectedDateTime |
| MIABIS-SAMPLE-05| Anatomical site ontology| collection.bodySite.coding.system |
| MIABIS-SAMPLE-06| Anatomical site ontology version| collection.bodySite.coding.version |
| MIABIS-SAMPLE-07| Anatomical site ontology code| collection.bodySite.coding.code |
| MIABIS-SAMPLE-08| Anatomical site ontology description| collection.bodySite.coding.display |
| MIABIS-SAMPLE-09| Anatomical site free text|  collection.bodySite.text |
| MIABIS-10| Sample content diagnosis| extension:*diagnosis* |
| MIABIS-11| Use restrictions| not yet supported |

#### Sample Donor

Corresponds to the Patient profile.

| Attribute Code| Attribute Name| FHIR |
|---|---|---|
| MIABIS-SAMPLEDONOR-01| Sample donor ID| no internal ids supported, use resource id |
| MIABIS-SAMPLEDONOR-02| Sex| gender (WARNING: Per FHIR definition this is the *Administrative Gender* of the patient, which may or may not equal the value for biological sex. Biobanks may report values based on different aspects of sex/gender here, see https://www.hl7.org/fhir/patient.html#gender |
| MIABIS-SAMPLEDONOR-03| Data categories| *calculated on-the-fly from bridgehead data* | 
| MIABIS-SAMPLEDONOR-04| Birth year| birthDate |

#### Study

Not supported


[1]:https://www.hl7.org/fhir/organization.html
