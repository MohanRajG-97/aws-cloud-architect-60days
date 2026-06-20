output "instance_id" {
  value = aws_instance.application.id
}

output "security_group_id" {
  value = aws_security_group.web.id
}
