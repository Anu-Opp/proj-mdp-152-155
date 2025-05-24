
#  Project 2: Kubernetes Cluster Setup with Terraform + Ansible

This project automates the creation of a **highly available Kubernetes cluster** using:
- **Terraform** for infrastructure provisioning on AWS
- **Ansible** for configuration and cluster management using **KOPS**

## 📁 Project Structure
```
project-2/
├── terraform/                # Infrastructure as Code (IaC)
│   ├── main.tf               # AWS VPC, EC2, S3, Route53 setup
│   ├── variables.tf          # Configurable variables
│   ├── outputs.tf            # Public IPs and DNS info
│   └── provider.tf           # AWS provider configuration
└── ansible/                  # Configuration Management
    ├── install_k8s_tools.yml # Installs KOPS, kubectl, AWS CLI on EC2
    ├── create_cluster.yml    # Creates Kubernetes cluster via KOPS
    └── delete_cluster.yml    # Deletes Kubernetes cluster via KOPS
```

##  Tools & Technologies
- AWS (EC2, S3, Route53)
- Terraform
- Ansible
- KOPS
- kubectl
- Ubuntu 20.04

```
- Provisions:
  - VPC
  - Public Subnets
  - S3 Bucket for KOPS
  - EC2 for Ansible (Ansible Master)
  - Route53 DNS Zone

w
