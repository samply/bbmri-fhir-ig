## Using References in Bundles

Using a FHIR server which supports *[update-as-create](https://www.hl7.org/fhir/http.html#upsert)* like [Blaze](https://github.com/life-research/blaze) allows to define the logical Ids and therefore the URLs of the created resources.
This proves useful when the store is filled via a large ETL-process since this means the logical Ids can be determined by the ETL-process directly.

This section provides some examples on how to deal with Bunle-internal and Bundle-external references in such a scenario.

### Internal References

Here, internal references mean references to other resources in a Bundle, for example, an Observation referes to a subject (Patient) that is part of the same *update-as-create* Bundle. This references consist of *[ResouceType]/[id]*, e.g. *Patient/23*.

### External References

External references point to resources outside a Bundle. These references have the form of *[fhirBase]/[ResourceType]/[id]*, e.g. *https://store.example.com/fhir/Collection/0*.

### fullUrls

In *create-as-update* Bundles, all entries need a *fullUrl*. This does not need to be an existing FHIR endpoint, as long as all entries use the same base all reference can be resolved. 
For example, using *http://example.com/* as a base is a working solution. Internal references to entries using the same base can be relative ([type]/[id]).
External references on the other hand need to be absolute, resolveable URLs.

If neither a absolute nor relative literal reference is possible, a [logical reference](https://www.hl7.org/fhir/references.html#logical) can be used to point to a resource e.g. by its Identifier. Note that servers will not necessarily resolve this references automatically, which may cause problems when trying to acess the referenced resource later on. 