#!/bin/bash
set -e

echo "📦 Building Terraform Artifact..."
echo ""

# Generate version from git or timestamp
if git rev-parse --git-dir > /dev/null 2>&1; then
  VERSION=$(git rev-parse --short HEAD)
else
  VERSION=$(date +%Y%m%d-%H%M%S)
fi

echo "Version: $VERSION"
echo ""

az login --identity

#hente tfvars fra keyvault
for env in dev test prod; do
  echo "Henter tfvars for miljø: $env"
  az keyvault secret download \
    --vault-name "$keyvault_name" \
    --name "$env-tfvars" \
    --file "env/${env}.tfvars" \

# Validate Terraform
echo "1️⃣ Validating Terraform..."
cd stacks/
terraform fmt -recursive || (echo "⚠️  Run 'terraform fmt -recursive' to fix formatting" && exit 1)
terraform init -backend=false
terraform validate
cd ..

echo "✅ Validation complete!"
echo ""

# Create artifact
echo "2️⃣ Creating artifact..."
ARTIFACT_NAME="terraform-${VERSION}.tar.gz"

tar -czf $ARTIFACT_NAME \
  stacks/ \
  env/ \
  backend-configs/

echo "✅ Artifact created: $ARTIFACT_NAME"
echo ""

# Show artifact info
echo "📊 Artifact Information:"
ls -lh $ARTIFACT_NAME


