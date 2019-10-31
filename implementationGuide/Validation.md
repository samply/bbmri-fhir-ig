# Validating Resources

While there are [multiple ways](https://www.hl7.org/fhir/validation.html) to validate FHIR ressources, we recommend using the Validator JAR. The full documentation for the JAR can be found [here](https://wiki.hl7.org/index.php?title=Using_the_FHIR_Validator). The following section gives step-by-step instructions for validating a resource against the BBMRI.de ImplementationGuide using the validator JAR.

*Since the package creation mechanism is currently still under development, this guide assumes all dependencies must be resolved manually by downloading files from other IGs. We are working on providing a package including the BBMRI.de artefacts and dependencies, which will make the extra downloading steps obsolete.** 
 
 **1. Download the latest JAR from [here](https://fhir.github.io/latest-ig-publisher/org.hl7.fhir.validator.jar)**. Using the latest version is important since bug-fixing updates happen regularly.
 
 **2. Download the BBMRI.de profiles from https://simplifier.net/bbmri.de** On the upper right corner under Download, select "Zip valid resources as JSON.
 
 **3. Unzip the profiles.** In this example, we assume the resulting folder is called "bbmri.de".
 
 **4. Download the dependencies.** The BBMRI.de IG depends on some items from the International Patient Summary, so download the package from [here](http://hl7.org/fhir/uv/ips/2019Sep/validator.pack) and save it e.g. as *IPS.pack* next to the folder with the BBMRI.de profiles. If you are using ICD-10-GM Codings in your Conditions, you also need [this](https://simplifier.net/basisprofil-de-r4/codingicd10gm) profile from the Deutsche Basisprofile. The JSON File can just be added to the BBMRI.de folder.
 
 **5. Move the resources you want to validate into one single, flat directory.** Every resource should be its own, meaningfully named JSON file. Files in subfolders will not be validated (this feature might be added in future validator releases).

 **6. Run the validator.** 
 Assuming you re-named the original validator JAR to validator.jar, placed it in the same directory as the folder *bbmri.de* containing the profiles and the *IPS.pack*, and have your resources in a subfolder named resources, use the command
  `java -jar validator.jar -version 4.1.0 -ig IPS.pack -ig bbmri.de resources`
 
 **7.Look at the output log.** FAILURE indicates an error that has to be fixed, while WARNINGS indicate problems that are sometimes the result of concious decisions, like choosing an external code for a field with a preferred ValueSet binding.
  Other warnings may be caused by the validator failing to find a ValueSet or CodeSystem and therefore being unable to validate a certain code.
  Still, warnings should always be examined to assure that their causes are intended features or validator faults and not implementer oversights.
  
  In addition to the GBA-Zulip, general validation issus are dicussed on the FHIR Chat [here](https://chat.fhir.org/#narrow/stream/179177-conformance).