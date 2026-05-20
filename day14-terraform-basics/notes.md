# Day 14 - Terraform Fundamentals

## Objective

Learn Infrastructure as Code (IaC) using Terraform by provisioning AWS infrastructure using declarative configuration files.

---

# What is Terraform?

Terraform is an Infrastructure as Code (IaC) tool developed by HashiCorp used to provision and manage cloud infrastructure using configuration files.

---

# Why Terraform is Important

Without Terraform:

- Manual infrastructure creation
- Human errors
- Configuration drift
- Difficult collaboration
- No reproducibility

With Terraform:

- Automated infrastructure
- Version-controlled infrastructure
- Reusable configurations
- Scalable deployments
- Consistent environments

---

# Architecture

Terraform
↓
AWS Provider
↓
S3 Bucket
↓
Infrastructure Creation

---

# Terraform Project Structure

| File | Purpose |
|---|---|
| main.tf | Infrastructure configuration |
| terraform.tfstate | Infrastructure state tracking |
| .terraform/ | Provider plugins |
| .terraform.lock.hcl | Provider version lock |

---

# Terraform Configuration

## Provider Block

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

Defines:

- Cloud provider
- AWS region

---

## Resource Block

```hcl
resource "aws_s3_bucket" "day14_bucket"
```

Defines:

- Infrastructure resource
- S3 bucket configuration

---

# Main Terraform File

```hcl
provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "day14_bucket" {
  bucket = "mohanraj-day14-tf-bucket-98765"

  tags = {
    Name        = "Day14TerraformBucket"
    Environment = "Dev"
  }
}
```

---

# Terraform Commands Used

## Initialize Terraform

```bash
terraform init
```

Purpose:

- Download provider plugins
- Initialize project
- Prepare Terraform environment

---

## Validate Configuration

```bash
terraform validate
```

Purpose:

- Check syntax correctness
- Detect configuration errors

---

## View Execution Plan

```bash
terraform plan
```

Purpose:

- Preview infrastructure changes
- Verify resources before creation

---

## Apply Infrastructure

```bash
terraform apply
```

Purpose:

- Create AWS infrastructure
- Execute Terraform plan

---

## Destroy Infrastructure

```bash
terraform destroy
```

Purpose:

- Remove managed infrastructure
- Avoid unnecessary cloud costs

---

# Terraform State File

Terraform creates:

```text
terraform.tfstate
```

Purpose:

- Tracks infrastructure state
- Maps Terraform resources to real AWS resources

Important:

Never manually edit terraform.tfstate.

---

# Important Terraform Concepts

## Declarative Infrastructure

Terraform defines:

"What infrastructure should exist"

NOT:

"Step-by-step commands"

---

## Idempotency

Running:

```bash
terraform apply
```

multiple times will NOT recreate unchanged infrastructure.

---

# Verification

Verified S3 bucket creation using:

```bash
aws s3 ls
```

Bucket created successfully:

```text
mohanraj-day14-tf-bucket-98765
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

# Concepts Learned

- Infrastructure as Code (IaC)
- Terraform Fundamentals
- Providers
- Resources
- Terraform State
- Infrastructure Planning
- Infrastructure Lifecycle Management
- Idempotency
- Automation

---

# Final Result

Successfully automated AWS infrastructure creation using Terraform.

Successfully created and destroyed AWS S3 bucket using Infrastructure as Code principles.
