#!/bin/bash

# Deploy infrastructure with Terraform
echo "Deploying infrastructure with Terraform..."
cd terraform/kubernetes
terraform init
terraform apply -auto-approve

# Store Terraform outputs for Ansible
MASTER_IP=$(terraform output -raw master_ip)
WORKER_AZ1_IP=$(terraform output -raw worker_az1_ip)
WORKER_AZ2_IP=$(terraform output -raw worker_az2_ip)

# Update Ansible inventory with new IPs
cd ../../ansible
sed -i "s/ansible_host=.*/ansible_host=$MASTER_IP/g" inventory.ini
sed -i "s/worker1 ansible_host=.*/worker1 ansible_host=$WORKER_AZ1_IP/g" inventory.ini
sed -i "s/worker2 ansible_host=.*/worker2 ansible_host=$WORKER_AZ2_IP/g" inventory.ini

# Wait for instances to be fully ready
echo "Waiting for instances to initialize..."
sleep 60

# Run Ansible playbooks
echo "Running Ansible playbooks to configure Kubernetes..."
ansible-playbook playbooks/install_prerequisites.yml
ansible-playbook playbooks/create_cluster.yml

echo "Kubernetes cluster deployment complete!"