# Day 15 - Terraform Variables and Outputs

## Objective

Learn reusable Infrastructure as Code (IaC) using Terraform Variables, terraform.tfvars, and Outputs.

---

# What are Terraform Variables?

Terraform variables are input parameters used to make infrastructure configurations dynamic and reusable.

Variables allow infrastructure to accept different values without changing the core Terraform code.

---

# Why Variables are Important

Without variables:

- Hardcoded infrastructure
- Difficult reuse
- Difficult scaling
- Poor flexibility

With variables:

- Reusable infrastructure
- Environment flexibility
- Cleaner automation
- Easier maintenance

---

# Project Architecture

Terraform Variables
↓
terraform.tfvars
↓
Parameterized Infrastructure
↓
AWS S3 Bucket
↓
Outputs

---

# Terraform Files Used

| File | Purpose |
|---|---|
| main.tf | Infrastructure logic |
| variables.tf | Variable definitions |
| terraform.tfvars | Variable values |
| outputs.tf | Infrastructure outputs |
| .gitignore | Ignore Terraform cache/state |

---

# Main Terraform Configuration

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "day15_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}
```

---

# Variable Definitions

```hcl
variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "bucket_name" {
  description = "S3 Bucket Name"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}
```

---

# terraform.tfvars

```hcl
aws_region = "ap-south-1"

bucket_name = "mohanraj-day15-bucket-98765"

environment = "dev"
```

---

# Outputs Configuration

```hcl
output "bucket_name" {
  value = aws_s3_bucket.day15_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.day15_bucket.arn
}
```

---

# What terraform.tfvars Does

terraform.tfvars stores actual variable values separately from infrastructure logic.

Benefits:

- Environment flexibility
- Reusability
- Cleaner infrastructure management
- Multi-environment deployments

---

# What Outputs Are

Outputs expose important infrastructure information after deployment.

Examples:

- Resource ARN
- Public IP
- DNS Names
- Bucket Names

Outputs are heavily used in enterprise Terraform architectures.

---

# Reusable Infrastructure Concept

Using variables allows the same Terraform code to deploy:

- Development environment
- Testing environment
- Staging environment
- Production environment

without modifying infrastructure logic.

---

# Important Terraform Concepts Learned

## Parameterization

Infrastructure becomes flexible using variables.

---

## Reusability

Same Terraform code works across multiple environments.

---

## Provider Version Pinning

```hcl
version = "~> 5.0"
```

Used for:

- stability
- compatibility
- controlled upgrades

---

## Outputs

Outputs expose infrastructure data for other systems/modules.

---

# Terraform Commands Used

## Initialize Terraform

```bash
terraform init
```

---

## Validate Configuration

```bash
terraform validate
```

---

## Preview Infrastructure

```bash
terraform plan
```

---

## Create Infrastructure

```bash
terraform apply
```

---

## Destroy Infrastructure

```bash
terraform destroy
```

---

# Verification

Verified bucket creation using:

```bash
aws s3 ls
```

Result:

```text
mohanraj-day15-bucket-98765
```

---

# Cleanup

Destroyed infrastructure successfully using:

```bash
terraform destroy
```

Result:

```text
Destroy complete! Resources: 1 destroyed.
```

---

# Real Enterprise Practice

Large organizations commonly use:

- dev.tfvars
- stage.tfvars
- prod.tfvars

with same Terraform codebase.

---

# Concepts Learned

- Terraform Variables
- terraform.tfvars
- Outputs
- Reusable Infrastructure
- Parameterized Infrastructure
- Provider Version Pinning
- Infrastructure Lifecycle Management
- Terraform Troubleshooting

---

# Final Result

Successfully created reusable Terraform infrastructure using variables and outputs.

Successfully provisioned and destroyed AWS S3 bucket using parameterized Infrastructure as Code principles.
