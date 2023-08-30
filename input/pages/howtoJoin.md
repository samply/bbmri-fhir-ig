This section describes how to connect your biobank to the [Sample Locator](https://samplelocator.bbmri.de) and what you need to have in place before you do so.

### About
The [Sample Locator](https://samplelocator.bbmri.de) is our central **non-commercial and open source service**, which enables scientists to search for specific research-relevant biosamples and related data across multiple academic biobanks distributed across Europe. Each biobank hosts a so-called Bridgehead, which connects to the central Sample Locator.

A Bridgehead comprises of two primary components:
* **The Blaze Store**. This holds the actual data being searched. This store must be filled by you, generally by running an ETL on your locally stored data to turn it into the standardized FHIR format that we require.
* **Spot and Beam**. These are the components that connect to the outside world. They collect the currently waiting queries from the Sample Locator, run them against the Blaze Store, and return aggregated results to the Sample Locator.

In order to make the data at your site searchable by the Sample Locator, you must *install a Bridgehead at your site*, *fill the Store with data*, and *register Beam with the central Beam Broker*.

More details about the functional principles of our IT infrastructure the can be found [here](https://www.bbmri.de/biobanking/it/functional-principle/?L=1).

The **organization behind** the development is the [German Biobank Node](https://www.bbmri.de/?L=1) in cooperation with [BBMRI-ERIC](http://www.bbmri-eric.eu), sponsored by the [Federal Ministry of Education and Research](https://www.bmbf.de/en/index.html).


### General Requirements
1. Installing and running a Bridgehead

The **Bridgehead** is the part of the federated search system that runs at your site locally. All requirements for installing and running a Bridgehead are documented [here](https://github.com/samply/bridgehead).

2. Data protection:  
Read this [Data protection concept](https://www.bbmri.de/biobanking/it/data-protection-concept/?L=1) carefully and submit it to your data protection authorities. The **data protection concept must be approved** by your local data protection officer.

3. Data access:  
To fill the Store of the Bridgehead you need access to clinical data from your **local source systems**. An overview about the clinical data which we want to provide in the ferderated search can be found [here](overview.html).

4. Data format:  
The Store of the Bridgehead stores data as **HL7 FHIR® Resources**. To import data into the Store, they must be harmonised and converted. Each site must build an ETL-pipeline (extract, transform, load) to harmonise the structure of the data and translate them to fit predefined FHIR® profiles.
You can find our FHIR® profile for the basic data set [here](https://simplifier.net/bbmri.de) and for the oncology data set [here](https://simplifier.net/oncology).

5. Definition of "Sample": 
A sample, as undestood by the Sample Locator, should satisfy the following conditions:

* Samples for which all parameters are identical are considered to be a single sample and will counted only once - or- may only be loaded once into the store. & 
* Aliquots for which all must-support parameters from the profile are identical are considered to be a single sample and should be loaded only one in the store.

6. Directory collections: 
The [BBMRI Directory](https://directory.bbmri-eric.eu) is a central resource that provides users standardized information about Biobanks in Europe. You will need to be registered with the Directory in order to be able to participate in the Sample Locator.

If possible, each sample that you wish to add to the Sample Locator should be assigned to a collection. Your collections should be registered with the Directory. Your ETL can be used to insert the relevant collection ID into each sample.

If this is **not** possible, then you should create or assign a single (default) collection specifically for use with the Locator. This collection should be registered with the Directory. Please let us know your default collection ID when you set up your Bridgehead.

A hybrid situation, where some of your samples have collections and some don't, is also possible. In this case, you will also need to let us know your default collection ID.


### Guides to install, fill and connect a Bridgehead
We provide a step-by-step installation guide on the [Bridgehead Deployment GitHub page](https://github.com/samply/bridgehead-deployment).

All of the components that make up the Bridgehead are open source. Non-technical descriptions of the components can be found [here](https://www.bbmri.de/biobanking/it/open-source-software/?L=1). If you wish to explore the source code of the components deployed, both locally at your site as well as centrally, please visit the [Component Finder](https://samply.github.io/samply-component-finder/). A complete list of our source code repositories can be found in the [GitHub samply Repository](https://github.com/samply).

#### FHIR® profiles and ETL:

* The BBMRI FHIR® base profiles can be found [here](https://simplifier.net/bbmri.de). The related Implementation Guide can be found [here](https://samply.github.io/bbmri-fhir-ig).

* The FHIR® oncology profiles can be found [here](https://simplifier.net/oncology). The related Implementation Guide can be found [here](https://simplifier.net/guide/implementationguide4/home).

* For implementing ETL, we recommend starting with the [Reference Implementation](https://github.com/BBMRI-cz/fhir-module).

* Alternatively, an example of how to build an ETL-process with Talend Open Studio for Data Integration and Hapi FHIR API can be found [here](etlTalent.html).

* Instructions on how to validate your FHIR® resources can be found [here](support.html).

#### Store documentations and tools:

* The official Store documentation can be found [here](https://github.com/samply/blaze#blaze).

* Specification for the REST interface used by the Store can be found [here](https://www.hl7.org/fhir/http.html).

* A standalone BBMRI FHIR® Test Data Generator can be found [here](https://github.com/samply/bbmri-fhir-gen).

* A tool to control and fill your FHIR® Store from the Command Line can be found [here](https://github.com/samply/blazectl).

#### Connector documentations and tools:

* The official Connector documentation can be found [here](https://github.com/samply/blaze#connector).

* Specification for the REST interface used by the Connector can be found [here](https://github.com/samply/share-client/blob/master/docs/diagram/Sequence_diagram_calls.md).

### Staying in contact

If you encounter problems or have further questions, you can contact us via the following email addresses:

* For problems or questions regarding the GBA (Sample Locator) network, please send an email to: feedback@germanbiobanknode.de
* For problems or questions regarding the BBMRI (Locator) network, please send an email to: federated-platform@helpdesk.bbmri-eric.eu

### Reinforcing the team
Interested in developing and enhancing the Sample Locator components or our other open source software? Read our [manifesto](https://samply.github.io/manifest) and join the Samply community!
