output "master_ip" {
  value = aws_instance.kubernetes_master.public_ip
}

output "worker_az1_ip" {
  value = aws_instance.kubernetes_worker_az1.public_ip
}

output "worker_az2_ip" {
  value = aws_instance.kubernetes_worker_az2.public_ip
}