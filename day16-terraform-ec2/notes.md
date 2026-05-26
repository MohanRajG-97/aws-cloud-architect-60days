 Day 16 — Terraform EC2 + Security Groups

## What is User Data?

User Data is a startup automation script executed automatically when EC2 launches.

It is used for:
- software installation
- server configuration
- automation
- bootstrapping

Example:
- install Apache
- start services
- deploy webpages

---

## What is a Security Group?

Security Group is a virtual firewall for EC2 instances.

It controls:
- inbound traffic
- outbound traffic

In this project:
- Port 22 allowed for SSH
- Port 80 allowed for HTTP

---

## What is Terraform Dependency Graph?

Terraform automatically understands resource relationships and creation order.

Example:

Security Group → EC2 Instance

Terraform creates Security Group first before EC2.

During destroy:
- EC2 destroyed first
- Security Group destroyed second

---

## Why Infrastructure Automation Matters

Automation provides:
- consistency
- repeatability
- scalability
- reduced human error
- faster deployments

Infrastructure becomes reproducible and recoverable.

---

## Difference Between Manual and Terraform Deployment

### Manual Deployment
- time consuming
- human errors
- inconsistent environments
- difficult scaling

### Terraform Deployment
- automated
- version controlled
- repeatable
- scalable
- faster provisioning

---

## Important Concepts Learned

- Infrastructure as Code
- EC2 Automation
- Security Groups
- User Data
- Terraform Variables
- Outputs
- Dependency Graph
- Idempotency
- Infrastructure Bootstrapping

---

## Real Enterprise Understanding

Today we automated:
- Security Group creation
- EC2 provisioning
- Apache installation
- Website deployment

using Terraform Infrastructure as Code.
