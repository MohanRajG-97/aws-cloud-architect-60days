# Day 39 - Terraform Enterprise Module Engineering

## Concepts Learned

* Terraform Module
* Root Module
* Child Module
* Module Inputs
* Module Outputs
* Module Reusability
* Enterprise Module Engineering
* Infrastructure Standardization

## Key Learnings

* A Terraform Module is a reusable collection of Terraform configuration files.
* Root Module calls Child Modules.
* Child Modules receive inputs through variables.
* Child Modules return values using outputs.
* One module can be reused multiple times with different inputs.
* Modules reduce code duplication and improve standardization.

## Enterprise Benefits

* Standardization
* Governance
* Security Compliance
* Faster Delivery
* Reusability
* Easier Maintenance

## Enterprise Architecture

Platform Team creates approved modules.

Application Teams consume approved modules.

Example:

Platform Team
↓
EC2 Module
↓
Application Team
↓
Deploy Infrastructure

## Lab Summary

* Built reusable EC2 module.
* Created module variables and outputs.
* Deployed web server using module.
* Deployed app server using same module.
* Verified both EC2 instances.
* Destroyed infrastructure successfully.

