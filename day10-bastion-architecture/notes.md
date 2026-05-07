# Day 10 - Bastion Architecture

## Components
- Bastion Host (Public Subnet)
- Private EC2 (Private Subnet)
- Security Groups
- NAT Gateway

## EC2 Details

### Bastion Host
- Public IP: 43.205.233.24
- Private IP: 10.0.1.217

### Private EC2
- Private IP: 10.0.2.118
- No Public IP

## Security Design
- Bastion Host allows controlled SSH access
- Private EC2 accepts SSH only from Bastion Security Group
- No direct internet SSH access to private server

## Connectivity Validation
- SSH successful: Bastion → Private EC2
- NAT Gateway verified using ping google.com
- yum update successful from private EC2

## Architecture Flow

Internet
   ↓
Bastion Host
   ↓
Private EC2

## Concept
Secure administrative access using Bastion Host (jump server) architecture.
