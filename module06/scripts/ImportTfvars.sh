#!/bin/bash

set -euo pipefail

keyvault_name="kv-tfstate-ir"
tfvars_path="./env"

for env in dev test prod; do

 fileContent=$(<"$tfvars_path/${env}.tfvars")
  echo "Lagrer tfvars for miljø: $env i KeyVault"

  az keyvault secret set \
    --vault-name "$keyvault_name" \
    --name "$env-tfvars" \
    --value "$fileContent" 
done

