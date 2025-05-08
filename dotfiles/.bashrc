# Load custom aliases
if [ -f ~/dotfiles/aliases ]; then
    source ~/dotfiles/aliases
fi

# Cloud & DevOps Tools version checker
cloud_versions() {
    echo "🔹 AWS CLI: $(aws --version 2>/dev/null || echo Not Installed)"
    echo "🔹 Azure CLI: $(az version | grep azure-cli || echo Not Installed)"
    echo "🔹 Google Cloud SDK: $(gcloud version | grep Google || echo Not Installed)"
    echo "🔹 OCI CLI: $(oci --version 2>/dev/null || echo Not Installed)"
    echo "🔹 Pulumi: $(pulumi version 2>/dev/null || echo Not Installed)"
    echo "🔹 Flux: $(flux --version 2>/dev/null || echo Not Installed)"
    echo "🔹 ArgoCD: $(argocd version --client 2>/dev/null || echo Not Installed)"
    echo "🔹 Helm: $(helm version --short 2>/dev/null || echo Not Installed)"
    echo "🔹 Kind: $(kind version 2>/dev/null || echo Not Installed)"
    echo "🔹 Kustomize: $(kustomize version 2>/dev/null || echo Not Installed)"
    echo "🔹 Stern: $(stern --version 2>/dev/null || echo Not Installed)"
    echo "🔹 k9s: $(k9s version --short 2>/dev/null || echo Not Installed)"
    echo "🔹 Vault: $(vault version 2>/dev/null || echo Not Installed)"
    echo "🔹 SOPS: $(sops --version 2>/dev/null || echo Not Installed)"
    echo "🔹 Cosign: $(cosign version 2>/dev/null || echo Not Installed)"
}

export PATH=$HOME/.pulumi/bin:$PATH