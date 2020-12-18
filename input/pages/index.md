### Introduction

A main goal of the German Biobank Node is the efficient exchange of biospecimens in order to collocate large, multicentric sample collections for research purposes.
The value of a biosample collection for science increases with the availability of substantial, quality-assured and comparable data. Therefore, GBN is constructing a national IT network as part of the German Biobank Alliance, which links the biobanks both within the consortium as well as with international biobank infrastructures such as BBMRI-ERIC.
	
The aim of this work package is to:
	- establish the technical prerequisites for a consistent search, application and joint use of biospecimens throughout Germany,
	- acquire and harmonise data on the biospecimens themself as well as on the associated clinical data and publish useful open-source software for joint medical research in cooperation with partner initiatives (DZG, NAKO, MII).

### Technical Overview

All locations participating in the German Biobank Alliance set up so-called bridgeheads on site. These bridgeheads are part of the decentralised search architecture. They retrieve and process centrally placed search queries and send aggregated results back to the central component.
An important part of the bridgeheads is a CQL-capable FHIR store, e.g. the Blaze store developed in GBA. The queries are translated into CQL and executed on the FHIR store. For this to work, FHIR data elements must be assigned to the search fields offered in the central sample locator and the corresponding data must be provided by the biobanks. The profiles described in this IG cover the GBA core search dataset and describe how it should be implemented in FHIR to enable evaluation of the CQL queries of the Sample Locator.