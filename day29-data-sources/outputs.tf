output "vpc_id" {
  value = data.aws_vpc.default.id
}

output "subnet_ids" {
  value = data.aws_subnets.default.ids
}

output "ami_id" {
  value = data.aws_ami.amazon_linux.id
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}
