### Validation

While there are [multiple ways](https://www.hl7.org/fhir/validation.html) to validate FHIR resources, we recommend using the Validator JAR. The full documentation for the JAR can be found [here](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator). The following section gives step-by-step instructions for validating a resource against the BBMRI.de ImplementationGuide using the validator JAR.

This IG and all dependencies are published as packages. This means you do not have to download anything manually (except the validator JAR), the vaidator will install the nescessary packages for you (usually in a *.fhir* folder in your home directory).

**1. Download the latest JAR from [here](https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar).** Using the latest version is important since bug-fixing updates happen regularly.

**2. Prepare your input** Move all resources you want to validate into a single flat directory and place it next to the validator JAR.

**3. Run the validator** Use `java -jar org.hl7.fhir.validator.jar -version 4.0.1 -ig de.bbmri.fhir#1.1.0 resources` for validation against version *1.1.0* of this IG. Alternatively, you can replace *1.1.0* with the number of the version you want to validate against. If you also use the DKTK/Oncology profiles, you need to change the call to `java -jar org.hl7.fhir.validator.jar -version 4.0.1 -ig de.dktk.oncology#1.0.2 resources`. The *de.bbrmi.fhir* package does not need to be supplied explictly since *de.dktk.oncology* declares a dependency on it which is resolved by the validator automatically.

**4. Look at the output log.** FAILURE indicates an error that has to be fixed, while WARNINGS indicate problems that are sometimes the result of conscious decisions, like choosing an external code for a field with a preferred ValueSet binding (like using the *RESEARCH* code defined in this IG as a ContactType). Other warnings may be caused by the validator failing to find a ValueSet or CodeSystem and therefore being unable to validate a certain code. Still, warnings should always be examined to assure that their causes are intended features or validator faults and not implementer oversights.

In addition to the GBA-Zulip, general validation issues are discussed on the FHIR Chat [here](https://chat.fhir.org/#narrow/stream/179177-conformance).

### Using References in Bundles

Using a FHIR server which supports *[update-as-create](https://www.hl7.org/fhir/http.html#upsert)* like [Blaze](https://github.com/life-research/blaze) allows to define the logical Ids and therefore the URLs of the created resources.
This proves useful when the store is filled via a large ETL-process since this means the logical Ids can be determined by the ETL-process directly.

This section provides some examples on how to deal with Bundle-internal and Bundle-external references in such a scenario.

#### Internal References

Here, internal references mean references to other resources in a Bundle, for example, an Observation referes to a subject (Patient) that is part of the same *update-as-create* Bundle. This references consist of *[ResouceType]/[id]*, e.g. *Patient/23*.

#### External References

External references point to resources outside a Bundle. These references have the form of *[fhirBase]/[ResourceType]/[id]*, e.g. *https://store.example.com/fhir/Collection/0*.

#### fullUrls

In *create-as-update* Bundles, all entries need a *fullUrl*. This does not need to be an existing FHIR endpoint, as long as all entries use the same base all reference can be resolved. 
For example, using *http://example.com/* as a base is a working solution. Internal references to entries using the same base can be relative ([type]/[id]).
External references on the other hand need to be absolute, resolveable URLs.

If neither a absolute nor relative literal reference is possible, a [logical reference](https://www.hl7.org/fhir/references.html#logical) can be used to point to a resource e.g. by its Identifier. Note that servers will not necessarily resolve this references automatically, which may cause problems when trying to acess the referenced resource later on.

### Handling missing values

Sometimes, even if a element is required, there is no value available e.g. because of corrupt source data. In this cases, the [data absent reason extension](https://www.hl7.org/fhir/extension-data-absent-reason.html) may be added to the element. Even without a value, the element will no longer be empty to the validator and the validation will succeed. The extension also allows to give the reason why no value is present, e.g. because of a not-a-number error.
