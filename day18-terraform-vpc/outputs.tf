output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}
