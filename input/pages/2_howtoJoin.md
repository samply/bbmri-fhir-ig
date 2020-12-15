This section describes how to connect a biobank to the [Sample Locator](https://samplelocator.bbmri.de) and what are the requirements to do so. This documentation is a central node with weblinks to important information and a step-by-step guidance.

### About
Biobanks need a network-IT infrastructure to exchange data efficiently. This allows to assort large multicentric collections of samples for research purposes. The [Sample Locator](https://samplelocator.bbmri.de) is our central **non-commercial and open source service** which enables scientists to search for specific research-relevant biosamples and related data across multiple academic biobanks. The IT infrastructure consists of a federate network of so-called bridgeheads. These are data integration IT-modules installed at each biobank and filled with relevant data from the biobank and clinic systems on-site. More details about the functional principle of IT infrastructure the can be found [here](https://www.bbmri.de/biobanking/it/functional-principle/?L=1).

The developer team is self-organized as [Samply community](https://samply.github.io/manifest). The **organization behind** the development is the [German Biobank Node](https://www.bbmri.de/?L=1) in cooperation with [BBMRI-ERIC](http://www.bbmri-eric.eu), sponsored by the [Federal Ministry of Education and Research](https://www.bmbf.de/en/index.html).


### General Requirements
1. Hardware:  
To **install the bridgehead** we recommend a server that can run [docker](https://docs.docker.com/get-docker/) (manual installation is also possible but not recommended) with the following requirements:
* 16 GB RAM
* 50 GB disk space (depends on amount of data)
* 2 or 4 CPU cores
* OS with support for [docker](https://docs.docker.com/get-docker/) (e.g. Linux, Windows 10 with hyper-V, macOS)
* Outgoing http and https
* Proxies are supported. No VPN or incoming ports required. 
* Firewall to restrict access from internal network is recommended.

2. Data protection:  
Read this [Data protection concept](https://www.bbmri.de/biobanking/it/data-protection-concept/?L=1) carefully and submit it to your data protection authorities. The **data protection concept must be approved** by your local data protection officer.

3. Data access:  
To fill the store of the bridgehead you need access to clinical data from your **local source systems**. An overview about the clinical data which we want to provide in the ferderated search can be found [here](1_overview.html).

4. Data transformation:  
The store of the bridgehead stores data as **HL7 FHIR® Bundles**. To import data into the Store, they must be harmonised and converted. Each site must build an ETL-process (extract, transform, load) to harmonise the structure of the data and translate them to fit predefined FHIR® profiles.
You can find our FHIR® profile for the basic data set [here](https://simplifier.net/bbmri.de) and for the oncology data set [here](https://simplifier.net/oncology).


### Guides to install, fill and connect a bridgehead
The needed software components are [open source](https://www.bbmri.de/biobanking/it/open-source-software/?L=1) and available at the [GitHub samply Repository](https://github.com/samply).

We provide an **step-by-step installation guide** in the Bridgehead Deployment readme [here](https://github.com/samply/bridgehead-deployment).

#### FHIR® profiles and ETL:

* The BBMRI FHIR® base profiles can be found [here](https://simplifier.net/bbmri.de). The related Implementation Guide can be found [here](https://samply.github.io/bbmri-fhir-ig).

* The FHIR® oncology profiles can be found [here](https://simplifier.net/oncology). The related Implementation Guide can be found [here](https://simplifier.net/guide/implementationguide4/home).

* An instruction how to build an ETL-process with Talend Open Studio for Data Integration and Hapi FHIR API can be found [here](6_etlTalent.html).

* An instruction how to validate your FHIR® resources can be found [here](5_support.html).

#### Store documentations and tools:

* The official Store documentation can be found [here](https://github.com/samply/blaze#blaze).

* Specification for the REST interface used by the Store can be found [here](https://www.hl7.org/fhir/http.html).

* A standalone BBMRI FHIR® Test Data Generator can be found [here](https://github.com/samply/bbmri-fhir-gen).

* A tool to control and fill your FHIR® Store from the Command Line can be found [here](https://github.com/samply/blazectl).


### Reinforcing the team
Interest in developing and enhancing the Sample Locator components or our other open source software? Read our [manifesto](https://samply.github.io/manifest) and join the Samply community!
