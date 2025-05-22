# 📦 Project 2: Kubernetes Cluster Setup with Terraform + Ansible

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

## ⚙️ Tools & Technologies
- AWS (EC2, S3, Route53)
- Terraform
- Ansible
- KOPS
- kubectl
- Ubuntu 20.04

## 🚀 How to Deploy
1. **Clone this repo** and navigate to `project-2`
2. **Terraform Setup**:
```bash
cd terraform
terraform init
terraform apply
```
- Provisions:
  - VPC
  - Public Subnets
  - S3 Bucket for KOPS
  - EC2 for Ansible (Ansible Master)
  - Route53 DNS Zone

3. **SSH into Ansible Master**:
```bash
ssh -i tom.pem ubuntu@<controller_public_ip>
```

4. **Install Kubernetes Tools**:
```bash
ansible-playbook install_k8s_tools.yml
```

5. **Create the Kubernetes Cluster**:
```bash
ansible-playbook create_cluster.yml
```

6. **Validate Cluster**:
```bash
kubectl get nodes
```

## 🧹 How to Delete the Cluster
```bash
ansible-playbook delete_cluster.yml
```

## ✅ Customization
You can update settings in `terraform/variables.tf`, such as:
- AWS region
- Availability Zones
- DNS zone name
- SSH key name
- Instance size

## 📝 Notes
- `KOPS_STATE_STORE` is stored in an S3 bucket and used to manage cluster state.
- Cluster validation is automatically done after creation.
- The EC2 instance has IAM permissions to access the S3 bucket directly.
