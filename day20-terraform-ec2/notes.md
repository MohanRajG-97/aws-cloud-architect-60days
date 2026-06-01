# Day 20 — Terraform EC2 Deployment Architecture

## What is Terraform EC2 Provisioning?

Terraform EC2 provisioning means deploying virtual servers automatically using Infrastructure as Code.

Terraform automates:
- EC2 creation
- networking
- routing
- firewall rules
- internet connectivity

without manual AWS Console operations.

---

## What is a Security Group?

Security Group acts like a virtual firewall for EC2 instances.

It controls:
- inbound traffic
- outbound traffic

Security Groups are stateful firewalls in AWS.

---

## What is Ingress?

Ingress means incoming traffic entering the EC2 instance.

Example:
- SSH access on port 22
- HTTP traffic on port 80

Today we allowed:
- SSH traffic from internet

---

## What is Egress?

Egress means outgoing traffic leaving the EC2 instance.

Example:
- software updates
- internet access
- API communication

Today we allowed:
- all outbound traffic

---

## Why Public Subnet is Required?

Public subnet allows EC2 instances to communicate with internet through Internet Gateway.

Without public subnet:
- SSH from internet fails
- public connectivity is unavailable

---

## Why Public IP is Important?

Public IP allows internet communication with EC2.

Without public IP:
- remote SSH access does not work
- internet cannot reach EC2

---

## What is Internet Gateway?

Internet Gateway connects AWS VPC to internet.

It enables:
- inbound internet traffic
- outbound internet traffic

for public resources.

---

## What is Route Table?

Route Table controls traffic routing inside VPC.

Example:
0.0.0.0/0 → Internet Gateway

Meaning:
send internet traffic through IGW.

---

## What is Terraform Dependency Graph?

Terraform automatically calculates infrastructure creation and destruction order.

Example:

VPC
 ↓
Subnet
 ↓
Internet Gateway
 ↓
Route Table
 ↓
Security Group
 ↓
EC2

Terraform manages dependencies automatically.

---

## Why Infrastructure as Code Matters?

Infrastructure as Code provides:
- automation
- reproducibility
- version control
- scalability
- disaster recovery capability

Large companies deploy infrastructure using Terraform pipelines.

---

## Important Concepts Learned

- EC2 Provisioning
- Security Groups
- Ingress Rules
- Egress Rules
- Public Subnets
- Internet Gateway
- Route Tables
- Public IP Architecture
- Terraform Dependency Graph
- Infrastructure as Code

---

## Real Enterprise Understanding

Today we automated:
- VPC networking
- public subnet architecture
- internet routing
- EC2 deployment
- firewall configuration
- compute infrastructure

using Terraform Infrastructure as Code.
