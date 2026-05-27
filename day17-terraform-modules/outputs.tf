output "public_ip" {
  value = module.ec2_module.public_ip
}

output "instance_id" {
  value = module.ec2_module.instance_id
}
