provider "aws" {
  region = var.aws_region
}

# Create VPC, subnets, security groups, etc.
resource "aws_vpc" "kubernetes_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "kubernetes-vpc"
  }
}

# Create subnets in different AZs for high availability
resource "aws_subnet" "kubernetes_subnet_az1" {
  vpc_id            = aws_vpc.kubernetes_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.availability_zones[0]
  tags = {
    Name = "kubernetes-subnet-az1"
  }
}

resource "aws_subnet" "kubernetes_subnet_az2" {
  vpc_id            = aws_vpc.kubernetes_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.availability_zones[1]
  tags = {
    Name = "kubernetes-subnet-az2"
  }
}

# Create security groups, internet gateway, route tables, etc.
# ...

# Create EC2 instances for Kubernetes master and worker nodes
resource "aws_instance" "kubernetes_master" {
  ami           = "ami-0c55b159cbfafe1f0" # Use the latest Amazon Linux 2 AMI
  instance_type = var.instance_type
  subnet_id     = aws_subnet.kubernetes_subnet_az1.id
  key_name      = "your-key-name" # Replace with your SSH key name
  # Add security groups, IAM roles, etc.
  tags = {
    Name = "kubernetes-master"
  }
}

resource "aws_instance" "kubernetes_worker_az1" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
  subnet_id     = aws_subnet.kubernetes_subnet_az1.id
  key_name      = "your-key-name"
  tags = {
    Name = "kubernetes-worker-az1"
  }
}

resource "aws_instance" "kubernetes_worker_az2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
  subnet_id     = aws_subnet.kubernetes_subnet_az2.id
  key_name      = "your-key-name"
  tags = {
    Name = "kubernetes-worker-az2"
  }
}