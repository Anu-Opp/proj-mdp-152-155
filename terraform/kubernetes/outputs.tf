output "controller_public_ip" {
  value = aws_instance.ansible_controller.public_ip
}

output "dns_zone_name" {
  value = aws_route53_zone.k8s_dns.name
}
