output "instance_id" {
  value = aws_instance.web.id
}

output "consumed_vpc_id" {
  value = data.terraform_remote_state.network.outputs.vpc_id
}

output "consumed_subnet_id" {
  value = data.terraform_remote_state.network.outputs.subnet_id
}
