# Day 21 — Terraform User Data Automation

## What is User Data?

User Data is an automated startup script executed during EC2 instance launch.

It allows:

* automatic software installation
* configuration management
* service startup
* bootstrap automation

without manual server setup.

---

## What is cloud-init?

cloud-init is the Linux initialization service that processes EC2 User Data during startup.

It automates:

* package installation
* script execution
* system configuration

during EC2 boot.

---

## What is Infrastructure Automation?

Infrastructure Automation means provisioning and configuring infrastructure automatically using code.

Benefits:

* reproducibility
* scalability
* faster deployments
* reduced manual work
* consistency

---

## What is Immutable Infrastructure?

Immutable Infrastructure means replacing broken servers instead of manually fixing them.

Process:

* destroy old server
* recreate fresh server
* redeploy automatically

Benefits:

* reliability
* consistency
* predictable deployments

---

## What is Security Group?

Security Group acts like a virtual firewall for EC2.

It controls:

* inbound traffic
* outbound traffic

Today we allowed:

* SSH access on port 22
* HTTP access on port 80

---

## What is User Data Bootstrap?

Bootstrap means automatic server initialization during startup.

Today EC2 automatically:

* launched
* executed startup script
* started Python HTTP server
* hosted webpage

without manual configuration.

---

## What is Terraform Taint?

terraform taint marks a resource for forced recreation.

It is used when:

* infrastructure becomes unhealthy
* bootstrap fails
* clean redeployment is required

Terraform destroys and recreates the resource during next apply.

---

## Important Concepts Learned

* EC2 Provisioning
* User Data
* cloud-init
* Security Groups
* Bootstrap Automation
* Immutable Infrastructure
* Terraform Taint
* Public Subnet Architecture
* Infrastructure as Code
* Automated Web Server Deployment

---

## Real Enterprise Understanding

Today we automated:

* VPC networking
* public subnet routing
* EC2 provisioning
* firewall configuration
* startup automation
* self-configuring web server deployment

using Terraform Infrastructure as Code.

