# Referenced FHIR Implementation Guides

## FHIR core profiles
When appropriate, this IG uses profiles defined as part of FHIR core (in the "Profiles & Extensions" tab on some resource pages, e.g. https://www.hl7.org/fhir/observation-profiles.html ).

## [Leitfaden Basis DE](https://simplifier.net/guide/basisprofil-de-r4/Home) (German Basis IG)
As of now (July 2019) the R4 version of the Basis DE IG is still in early draft stages. Since many profiles will be based on existing FHIR core profiles, we expect some degree of compatibility.

## [International Patient Summary (IPS)](https://build.fhir.org/ig/HL7/fhir-ips/index.html)
Although the IPS contains profiles for smoking status, BMI, body height and body weight, the BBMRI.de profiles for these observations are not derived from the IPS since they require the referenced patient to be an [IPS Patient](https://build.fhir.org/ig/HL7/fhir-ips/StructureDefinition-Patient-uv-ips.html). We cannot derive our own patient profile from this patient since the IPS requires at least some part of the patient name to be present which does not fit with the premise of de-identified data being stored in the bridgehead. 
Still, since our profiles are based on profiles from the FHIR core spec, we expect processing applications to be able to transform BBMRI.de-conformant to IPS-conformat resources. In other cases where no core profile (and neither a Basis DE profile) is available, e.g. smoking status, we use the same LOINC codes and Value Sets as the corresponding IPS profiles.
