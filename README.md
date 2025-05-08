# cloud-devops-automation

[![CI](https://github.com/prabhakaran-jm/cloud-devops-automation/actions/workflows/bootstrap-test.yml/badge.svg)](https://github.com/prabhakaran-jm/cloud-devops-automation/actions/workflows/bootstrap-test.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Ansible](https://img.shields.io/badge/Ansible-Ready-blue.svg)](https://www.ansible.com/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/prabhakaran-jm/cloud-devops-automation/pulls)
[![Workstation as Code](https://img.shields.io/badge/Workstation%20as%20Code-Automated-orange)]()

---

## 🚀 Overview

**cloud-devops-automation** is a fully automated DevOps workstation setup:

- **Provisioning:** Local VMs (Vagrant) or cloud VMs (Terraform)
- **Configuration Management:** Ansible Playbook
- **Toolchain Install:** Cloud CLIs, Kubernetes tools, GitOps utilities, IaC tools
- **Validation:** Automated preflight check script
- **CI/CD:** GitHub Actions workflow tests the bootstrap process

This project follows the **Workstation as Code** approach for reproducibility, automation, and scalability.

---

## ⚡ Quick Start

### 🖥 Local VM (Vagrant)

```bash
vagrant up
```

### ☁ Cloud VM (Terraform - AWS Example)

```bash
cd terraform
terraform init
terraform apply
```


### 🔧 Manual Bootstrap (if not using Ansible/Vagrant/Terraform)
```bash
./bootstrap-devops.sh
```

### ✅ Validate installation (Preflight check)
```bash
./preflight-check.sh
```

## 📝 Features

Idempotent Ansible Playbook

Supports:

Docker

Terraform

Pulumi

Flux

ArgoCD

Helm

Kind

Kustomize

Stern

k9s

Vault

SOPS

Cosign

Cloud CLIs for:

AWS

Azure

GCP

OCI

Additional:

Automated version checks for all tools

Preflight script runs automatically after Ansible completes

GitHub Actions CI pipeline for validation

Expandable to team-wide workstation provisioning


## 📂 Repo Structure  

bootstrap-devops.sh               # Manual setup script
preflight-check.sh                # Validation script
site.yml                          # Ansible Playbook
.github/workflows/                # GitHub Actions workflow
.github/ISSUE_TEMPLATE/           # Bug and feature templates
.github/pull_request_template.md  # PR template
dotfiles/                         # Shell customization (.bashrc, aliases, .vimrc)
Vagrantfile                       # Local VM provisioning
terraform/main.tf                 # Cloud VM provisioning (AWS)
README.md                         # This file


## 🛡 License
This project is licensed under the MIT License.