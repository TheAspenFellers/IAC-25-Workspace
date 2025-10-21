# Obligatorisk øving 2 — IaC med Terraform, GitHub og Azure

Forutsetninger 
- GitHub-repo med Actions aktivert og OIDC/Federated Credentials konfigurert mot Azure AD.
- En Resource Group som inneholder: (Se ./backend)
    - Storage Account med en container for Terraform state-filer.
    - Key Vault for oppbevaring av sensitive verdier.

Mappelayout og filer
- README.md
- .github/
    - workflows/
        - ci.yml                
        - cd.yml                
- stacks/
    - main.tf
    - variables.tf
    - locals.tf
- env/
    - dev.tfvars
    - test.tfvars
    - prod.tfvars
- scripts/
    - build.sh       
    - deploy.sh      
    - ImportTfvars.sh
- backend-configs/
    - dev.hcl
    - prod.hcl
    - test.hcl
- backend/
    - backend.hcl
    - locals.tf
    - main.tf
    - outputs.tf
    - terraform.tfvars
    - variables.tf

# Arbeidsflyten

1. Selve infrastrukturen skrives lokalt i ./stacks. I ett større prosjekt vil man gjerne ha moduler i tillegg. Når man har gjort nødvendige endringer eller skrevet terraform koden kan den pushes til en ny feature eller dev branch. Deretter oppretter man en pull request mot main. Før vi går videre må vi også huske å kjøre ImportTfvars.sh for å få flytta .tfvars filene til key vaulten i backend. 

2. CI.yml trigges av en pull request. Her kjøres build.sh scriptet. Scriptet validerer koden henter tfvars fra keyvault og lager ett artifact. Til slutt lastes artifactet opp til backend SAen.

3. Når pull requesten har trigget CI.yml og testen lykkes merger vi med main. Da trigges CD.yml. Her hentes artifactet. Deretter starter vi tre jobber. En for hvert miljø. Hver job bruker artifactet til å få tilgang til den relevante state filen og bruker de miljøspesifikke variablene fra tfvars til å kjøre deploy.sh scriptet. Her blir terraform plan og apply kjørt. Før jobben til prod miljøet får kjøre må vi ha godkjenning.
