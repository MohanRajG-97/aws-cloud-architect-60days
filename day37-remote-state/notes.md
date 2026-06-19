# Day 37 – Terraform Remote State Data Sources

## Objective

Learn how Terraform projects share infrastructure using terraform_remote_state.

## Network Project

Created:

* VPC
* Public Subnet

Outputs:

* vpc_id
* subnet_id

## Application Project

Consumed outputs from Network Project using:

terraform_remote_state

Created:

* Security Group
* EC2 Instance

## Remote State Flow

Network Project

Creates:

* VPC
* Subnet

Outputs:

* vpc_id
* subnet_id

↓

terraform.tfstate

↓

Application Project

Reads:

* vpc_id
* subnet_id

Creates:

* Security Group
* EC2

## Benefits

* No hardcoded IDs
* Infrastructure reuse
* Team separation
* Safer deployments
* Enterprise scalability

## Key Learning

terraform_remote_state allows one Terraform project to consume outputs from another Terraform project's state file.

## Enterprise Usage

* Shared VPCs
* Shared Networking
* Shared Security Infrastructure
* Platform Engineering
* Multi-Team Terraform Architectures

## Cleanup

Destroyed in correct order:

1. Application Project
2. Network Project

Reason:

Dependencies must be removed before underlying infrastructure.

