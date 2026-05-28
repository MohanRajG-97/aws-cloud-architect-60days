# Day 18 — Terraform VPC + Network Automation

## What is Terraform Networking Automation?

Terraform Networking Automation means creating and managing cloud networking infrastructure using Infrastructure as Code.

Instead of manually configuring networking in AWS Console, Terraform automates:
- VPC creation
- subnet creation
- routing
- internet access
- network associations

Benefits:
- repeatability
- consistency
- scalability
- reduced human error

---

## What is a VPC?

VPC (Virtual Private Cloud) is an isolated private network inside AWS.

It is the foundational network layer where cloud resources run.

Example:
- EC2
- databases
- Kubernetes
- load balancers

all run inside a VPC.

---

## What is a Subnet?

A subnet is a smaller network inside a VPC.

Subnets help:
- network segmentation
- security separation
- workload isolation

Example:
- public subnet
- private subnet

---

## What is an Internet Gateway?

Internet Gateway (IGW) provides internet connectivity for a VPC.

Without IGW:
- resources cannot access internet
- public websites cannot work

IGW acts like a bridge between AWS VPC and internet.

---

## What is a Route Table?

Route Table defines how network traffic moves inside a VPC.

Example:
0.0.0.0/0 → Internet Gateway

Meaning:
send all internet traffic through IGW.

---

## What is Route Table Association?

Route Table Association connects:
- subnet
- route table

Without association:
- subnet cannot use routing rules

---

## What is Terraform Dependency Graph?

Terraform automatically calculates resource creation and destruction order.

Example:

VPC
 ↓
Subnet
 ↓
Internet Gateway
 ↓
Route Table
 ↓
Route Association

Terraform understands dependencies automatically.

---

## Why Infrastructure as Code Matters for Networking

Infrastructure as Code provides:
- reproducibility
- automation
- version control
- scalability
- disaster recovery capability

Large companies deploy complete cloud networks using Terraform.

---

## Important Concepts Learned

- VPC
- Subnet
- Internet Gateway
- Route Table
- Route Association
- Dependency Graph
- Network Automation
- Infrastructure as Code
- CIDR Planning
- Routing Automation

---

## Real Enterprise Understanding

Today we automated:
- VPC creation
- subnet configuration
- internet connectivity
- traffic routing

using Terraform networking automation.
