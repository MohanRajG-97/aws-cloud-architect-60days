output "security_group_id" {

  value = aws_security_group.dynamic_sg.id
}

output "allowed_ports" {

  value = var.allowed_ports
}
