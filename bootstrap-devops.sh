#!/bin/bash

set -e

echo "👉 Updating system..."
sudo apt-get update -y
sudo apt-get upgrade -y

echo "👉 Installing essential tools..."
sudo apt-get install -y build-essential git curl wget unzip gnupg lsb-release ca-certificates software-properties-common apt-transport-https

########################################
# 1️⃣ Dev Tools
########################################

# Terraform
echo "👉 Installing Terraform..."
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update -y
sudo apt-get install -y terraform

# Kubectl
echo "👉 Installing kubectl via snap..."
sudo snap install kubectl --classic

# Docker
echo "👉 Installing Docker..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor | sudo tee /etc/apt/keyrings/docker.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

# Ansible & jq
sudo apt-get install -y ansible jq

########################################
# 2️⃣ Cloud SDKs
########################################

# AWS CLI
echo "👉 Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -o awscliv2.zip
sudo ./aws/install --update
rm -rf aws awscliv2.zip

# Azure CLI
echo "👉 Installing Azure CLI..."
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Google Cloud SDK
echo "👉 Installing Google Cloud SDK..."
sudo apt-get install -y apt-transport-https ca-certificates gnupg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | \
    sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/cloud.google.gpg > /dev/null
sudo apt-get update -y && sudo apt-get install -y google-cloud-cli

# OCI CLI
echo "👉 Installing OCI CLI..."
bash -c "$(curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh)" -- --accept-all-defaults

########################################
# 3️⃣ Advanced DevOps Tools
########################################

echo "👉 Installing Pulumi..."
curl -fsSL https://get.pulumi.com | sh

echo "👉 Installing Flux..."
curl -s https://fluxcd.io/install.sh | sudo bash

echo "👉 Installing ArgoCD..."
curl -sSL -o argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
chmod +x argocd
sudo mv -f argocd /usr/local/bin/

echo "👉 Installing Stern..."
curl -Lo stern https://github.com/stern/stern/releases/latest/download/stern_linux_amd64
chmod +x stern
sudo mv -f stern /usr/local/bin/stern

echo "👉 Installing k9s..."
curl -Lo k9s https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_x86_64
chmod +x k9s
sudo mv -f k9s /usr/local/bin/k9s

echo "👉 Installing kubectx & kubens..."
sudo snap install kubectx --classic

echo "👉 Installing AWS Vault..."
curl -Lo aws-vault https://github.com/99designs/aws-vault/releases/latest/download/aws-vault-linux-amd64
chmod +x aws-vault
sudo mv -f aws-vault /usr/local/bin/aws-vault

echo "👉 Installing SOPS..."
curl -Lo sops https://github.com/getsops/sops/releases/latest/download/sops-linux-amd64
chmod +x sops
sudo mv -f sops /usr/local/bin/sops

echo "👉 Installing Vault..."
sudo apt-get install -y vault

echo "👉 Installing Cosign..."
curl -LO https://github.com/sigstore/cosign/releases/latest/download/cosign-linux-amd64
chmod +x cosign-linux-amd64
sudo mv -f cosign-linux-amd64 /usr/local/bin/cosign

########################################
# 4️⃣ Dotfiles
########################################

echo "👉 Cloning and applying dotfiles..."
git clone https://github.com/YOUR_GITHUB/dotfiles.git ~/dotfiles || true

if ! grep -q "source ~/dotfiles/.bashrc" ~/.bashrc; then
    echo "source ~/dotfiles/.bashrc" >> ~/.bashrc
fi

########################################
# 5️⃣ Final
########################################

echo "✅ All tools and dotfiles installed."
echo "⚡ Please reboot or log out and log back in to apply Docker group changes."