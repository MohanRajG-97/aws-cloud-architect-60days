# Day 17 — Terraform Modules

## What is a Terraform Module?

A Terraform Module is a reusable infrastructure component that groups related resources together.

Modules help:
- reuse infrastructure
- reduce duplicate code
- standardize deployments
- improve scalability

---

## Root Module vs Child Module

### Root Module
The main orchestration layer.

Responsibilities:
- calls child modules
- passes variables
- manages deployment flow

### Child Module
Reusable infrastructure component.

Responsibilities:
- contains actual resources
- creates infrastructure
- exposes outputs

---

## What is Module Reusability?

Modules can be reused across:
- development
- staging
- production

without rewriting infrastructure code.

Only variable values change.

---

## What are Module Inputs?

Module inputs are variables passed from root module to child module.

Example:
- ami_id
- instance_type
- key_name

---

## What are Module Outputs?

Outputs expose important infrastructure information from child module back to root module.

Examples:
- public_ip
- instance_id

---

## What is Module Encapsulation?

Modules hide internal implementation details.

Root module interacts using:
- variables
- outputs

This is similar to software engineering abstraction.

---

## What is Terraform Module Expansion?

Terraform expands module blocks into actual infrastructure resources during execution.

Example:

module.ec2_module.aws_instance.web_server

---

## Why Modules Matter in Enterprise?

Modules provide:
- standardization
- reusability
- maintainability
- scalability
- centralized infrastructure management

Large organizations use shared Terraform modules across teams.

---

## Infrastructure Automated Today

Today we automated:
- Security Group creation
- EC2 provisioning
- Apache installation
- Website deployment

using reusable Terraform modules.

---

## Important Concepts Learned

- Terraform Modules
- Root Modules
- Child Modules
- Module Inputs
- Module Outputs
- Module Encapsulation
- Module Reusability
- Dependency Graph
- User Data
- Infrastructure as Code
