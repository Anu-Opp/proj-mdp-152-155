variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "availability_zones" {
  description = "AZs to deploy nodes across (for HA)"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "instance_type" {
  description = "EC2 instance type for Kubernetes nodes"
  default     = "t2.medium"
}
variable "key_name" {
  description = "SSH Key Name"
  default     = "tom.pem"
}

variable "dns_zone_name" {
  description = "DNS zone for KOPS cluster"
  default     = "dev.k8s.local"  # <<< personalize this if needed
}