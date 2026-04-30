# Day 9 - Production VPC

## VPC
- VPC ID: vpc-0ea58f8e325413636
- CIDR: 10.0.0.0/16

## Subnets
- Public Subnet: subnet-08dd504cff0097181 (10.0.1.0/24)
- Private Subnet: subnet-05578c2fb7a94d09c (10.0.2.0/24)

## Internet Gateway
- IGW ID: igw-0133af41444959d08

## NAT Gateway
- NAT ID: nat-07c2e2b15410805b4
- Elastic IP: 13.205.220.240

## Route Tables

### Public Route Table
- Route: 0.0.0.0/0 → IGW
- Associated Subnet: Public Subnet

### Private Route Table
- Route: 0.0.0.0/0 → NAT Gateway
- Associated Subnet: Private Subnet

## Architecture

Public:
EC2 → IGW → Internet

Private:
EC2 → NAT → IGW → Internet

## Concept

This architecture ensures:
- Public resources are internet accessible
- Private resources are secured
- Outbound internet access via NAT
- No inbound internet exposure for private subnet
