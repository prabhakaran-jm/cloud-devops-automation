## Quick start

### Local VM (Vagrant)
```bash
vagrant up
```

### Cloud VM (Terraform)
```bash
cd terraform
terraform init
terraform apply
```

### Ansible Playbook
```bash
./bootstrap-devops.sh
```

### Check tool versions
```bash
./preflight-check.sh
```

You now have a **production-ready, fully automated DevOps workstation setup** that can:

- Be tested in CI/CD
- Run locally or in the cloud
- Scale to team members or new environments
- Be audited and validated automatically