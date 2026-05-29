# Day 19 — Terraform Multi-Tier Production VPC

## What is Multi-Tier Architecture?

Multi-tier architecture separates infrastructure into different layers for:
- security
- scalability
- isolation
- performance

Typical layers:
- public layer
- application layer
- database layer

---

## What is a Public Subnet?

Public subnet has direct internet connectivity through Internet Gateway.

Resources inside public subnet can:
- receive internet traffic
- access internet directly

Examples:
- Load Balancer
- NAT Gateway
- Bastion Host

---

## What is a Private Subnet?

Private subnet does NOT have direct public internet access.

Resources inside private subnet:
- are protected from internet
- use NAT Gateway for outbound internet access

Examples:
- application servers
- databases
- backend APIs

---

## What is NAT Gateway?

NAT Gateway allows private subnet resources to access internet securely without being publicly reachable.

It provides:
- outbound internet access
- package download capability
- update access

without exposing servers publicly.

---

## What is an Elastic IP?

Elastic IP is a static public IP address in AWS.

NAT Gateway requires Elastic IP for internet communication.

---

## What is Route Segmentation?

Different route tables are used for:
- public traffic
- private traffic

Public route:
0.0.0.0/0 → Internet Gateway

Private route:
0.0.0.0/0 → NAT Gateway

---

## What is Terraform Dependency Graph?

Terraform automatically calculates infrastructure creation and destruction order.

Example:

VPC
 ↓
Subnets
 ↓
NAT Gateway
 ↓
Route Tables

Terraform manages dependencies automatically.

---

## Why Multi-Tier Networking Matters

Production systems require:
- security isolation
- reduced attack surface
- workload separation
- scalable architecture

Multi-tier networking provides secure infrastructure design.

---

## Important Concepts Learned

- Public Subnet
- Private Subnet
- NAT Gateway
- Elastic IP
- Route Segmentation
- Multi-Tier Architecture
- Infrastructure as Code
- Terraform Dependency Graph
- Secure Networking

---

## Real Enterprise Understanding

Today we automated:
- segmented VPC architecture
- public/private subnet design
- NAT-based outbound internet
- route isolation
- secure networking

using Terraform Infrastructure as Code.
