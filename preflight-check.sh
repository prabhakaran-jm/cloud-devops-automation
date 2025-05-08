#!/bin/bash

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

check() {
    echo -n "$1... "
    if eval "$2" &> /dev/null; then
        echo -e "${GREEN}OK${NC}"
    else
        echo -e "${RED}FAILED${NC}"
    fi
}

echo "🔎 Checking CLI tools..."
check "AWS CLI" "aws --version"
check "Azure CLI" "az version"
check "Google Cloud SDK" "gcloud version"
check "OCI CLI" "oci --version"
check "Terraform" "terraform version"
check "Pulumi" "pulumi version"
check "Flux" "flux --version"
check "ArgoCD" "argocd version --client"
check "Helm" "helm version --short"
check "Kind" "kind version"
check "Kustomize" "kustomize version"
check "Stern" "stern --version"
check "k9s" "k9s version --short"
check "Vault" "vault version"
check "SOPS" "sops --version"
check "Cosign" "cosign version"

echo ""
echo "🔎 Checking Docker daemon..."
if docker info &> /dev/null; then
    echo -e "Docker daemon... ${GREEN}Running${NC}"
else
    echo -e "Docker daemon... ${RED}NOT running${NC}"
fi

echo ""
echo "🔎 Checking Kubernetes cluster connection..."
if kubectl cluster-info &> /dev/null; then
    echo -e "kubectl cluster-info... ${GREEN}Connected${NC}"
else
    echo -e "kubectl cluster-info... ${RED}Not connected${NC}"
fi

echo ""
echo "🔎 Checking Cloud CLI authentications..."

check "AWS identity" "aws sts get-caller-identity"
check "Azure account" "az account show"
check "GCP account" "gcloud auth list --format='value(account)'"
check "OCI region list" "oci iam region list"

echo ""
echo -e "${GREEN}✅ Preflight check complete.${NC}"