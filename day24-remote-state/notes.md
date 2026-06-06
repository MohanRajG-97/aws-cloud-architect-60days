# Day 24 – Terraform Remote State + S3 Backend

## Objective

Learn and implement Terraform Remote State using Amazon S3 Backend.

---

## What is Terraform State?

Terraform State is a file that stores information about the infrastructure managed by Terraform.

Default state file:

terraform.tfstate

Terraform uses state to:

- Track resources it manages
- Store resource IDs
- Understand dependencies
- Detect infrastructure changes

---

## Why is Terraform State Important?

Without state:

- Terraform loses track of resources
- Duplicate resources may be created
- Destroy operations may fail
- Infrastructure drift can occur

Terraform State acts as the source of truth.

---

## Local State vs Remote State

### Local State

Stored on local machine:

terraform.tfstate

Risks:

- File deletion
- Laptop failure
- No team collaboration
- No backup

### Remote State

Stored in Amazon S3.

Benefits:

- Centralized storage
- High durability
- Shared access
- Recovery using versioning

---

## S3 Backend Configuration

backend.tf

terraform {
  backend "s3" {
    bucket = "mohanraj-day24-tfstate-20260606"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

---

## Versioning Importance

S3 Versioning protects Terraform state by maintaining previous versions.

Benefits:

- State recovery
- Protection against accidental deletion
- Protection against corruption

---

## Enterprise Architecture

Terraform Engineers
        ↓
    S3 Backend
        ↓
terraform.tfstate
        ↓
AWS Infrastructure

Large organizations also use:

S3 Backend
    +
DynamoDB State Locking

---

## Commands Used

terraform init

terraform validate

terraform plan

terraform apply

aws s3 ls

aws s3api get-bucket-versioning --bucket <bucket-name>

terraform init

(terraform state migration)

terraform destroy

---

## CloudShell Storage Issue Resolution

Problem:

Error: no space left on device

Solution:

export TF_PLUGIN_CACHE_DIR=/tmp/.terraform.d/plugin-cache

mkdir -p /tmp/.terraform.d/plugin-cache

terraform init

---

## Versioned Bucket Cleanup Process

Delete object versions

Delete delete markers

Delete S3 bucket

Versioned buckets require additional cleanup before deletion.

---

## Key Learnings

- Terraform State is critical.
- Remote State improves collaboration.
- S3 Versioning protects state.
- Versioned buckets require special cleanup.
- CloudShell storage limitations can affect Terraform operations.
