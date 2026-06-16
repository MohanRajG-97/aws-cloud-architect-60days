output "full_name" {
  value = local.full_name
}

output "split_name" {
  value = local.split_name
}

output "owner_count" {
  value = local.owner_count
}

output "uppercase_project" {
  value = local.uppercase_project
}

output "lowercase_environment" {
  value = local.lowercase_environment
}

output "merged_tags" {
  value = local.merged_tags
}

output "combined_owners" {
  value = local.combined_owners
}

output "department" {
  value = local.department
}

output "instance_id" {
  value = aws_instance.web.id
}
