# Mappings
This section descripes how the profiles defined in this guide relate to several other data models, mainly from other biobank-related projects. Items in *italic* imply slice names.

## BBMRI-ERIC  Directory

### Biobank
The BBMRI-ERIC Directory *Biobank* entity corresponds to the *Biobank* profile from this guide.

| BBMRI-ERIC | Biobank Profile |
|--|--|
|id | identifier:*Bbmri-EricId*.value |
|name | name |
|acronym | alias |
|description | extension.description.value |
|url | telecom:*url*.value|
|juridical_person | extension.juridicalPerson.value |
|country | address.country |
|head_title_before_name | contact:*head*.name.prefix |
|head_firstname | contact:*head*.name.given |
|head_lastname | contact:*head*.name.family |
|head_title_after_name | contact:*head*.name.suffix |
|contact | *see section contact* |
|network | *see section network* |

### Contact Information
In FHIR, the contact information is included in the *Organization* resource, which is profiled as *Biobank* in this guide.

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
|country | contact:*contact*.address.county |

### Collection
### Network






## MIABIS

TODO
