output "instance_id" {

  value = aws_instance.web.id
}

output "instance_name" {

  value = aws_instance.web.tags.Name
}

output "common_tags" {

  value = local.common_tags
}

output "security_group_name" {

  value = aws_security_group.web.name
}
