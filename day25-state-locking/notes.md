# Day 25 – Terraform State Locking with DynamoDB

## Objective

Learn and implement Terraform State Locking using DynamoDB with an S3 Backend to enable safe team collaboration in enterprise environments.

---

## What is Terraform State Locking?

Terraform State Locking prevents multiple Terraform operations from modifying the same state file simultaneously.

Workflow:

Terraform Apply
↓
Acquire Lock
↓
Modify Infrastructure
↓
Update State File
↓
Release Lock

---

## Why is State Locking Important?

Without locking:

* Multiple engineers can run Terraform simultaneously.
* State file corruption may occur.
* Infrastructure drift can happen.
* Production outages become possible.

With locking:

* Only one Terraform operation modifies infrastructure at a time.
* Infrastructure consistency is maintained.

---

## Problem Without Locking

Engineer A:

terraform apply

At the same time:

Engineer B:

terraform apply

Result:

Concurrent State Modification
↓
State Corruption
↓
Infrastructure Inconsistency

---

## Why DynamoDB is Used for Locking

DynamoDB provides:

* Atomic locking operations
* High availability
* Low operational overhead
* AWS-native integration
* Cost-effective PAY_PER_REQUEST billing

Terraform uses DynamoDB to manage lock information safely.

---

## S3 and DynamoDB Backend Architecture

Terraform
↓
DynamoDB Table
↓
Acquire State Lock

Terraform
↓
Amazon S3
↓
Store terraform.tfstate

Terraform
↓
Release Lock

---

## DynamoDB Lock Table Configuration

resource "aws_dynamodb_table" "terraform_locks" {
name         = "terraform-locks"
billing_mode = "PAY_PER_REQUEST"

hash_key = "LockID"

attribute {
name = "LockID"
type = "S"
}

tags = {
Name = "Terraform State Lock Table"
}
}

---

## Backend Configuration

terraform {
backend "s3" {
bucket         = "mohanraj-day25-tfstate-20260606"
key            = "terraform.tfstate"
region         = "ap-south-1"
dynamodb_table = "terraform-locks"
}
}

---

## S3 Backend Responsibilities

* Store Terraform state remotely.
* Enable team collaboration.
* Support versioning and recovery.
* Provide centralized state management.

---

## DynamoDB Responsibilities

* Prevent concurrent Terraform operations.
* Protect state integrity.
* Coordinate infrastructure modifications safely.

---

## Enterprise Workflow

Developer
↓
GitHub / GitLab
↓
CI/CD Pipeline
↓
Terraform Plan
↓
Terraform Apply
↓
Acquire Lock (DynamoDB)
↓
Update State (S3)
↓
Release Lock

---

## Commands Used

terraform init

terraform validate

terraform plan

terraform apply

aws dynamodb describe-table 
--table-name terraform-locks 
--query 'Table.[TableName,TableStatus]' 
--output table

aws s3 ls s3://mohanraj-day25-tfstate-20260606/

terraform destroy

---

## Key Learnings

* Terraform State Locking prevents simultaneous modifications.
* DynamoDB provides safe lock management.
* S3 stores Terraform state centrally.
* State protection is essential for enterprise environments.
* Team collaboration requires both remote state and locking.

---

## Interview Questions

### What is Terraform State Locking?

Terraform State Locking prevents multiple Terraform operations from modifying the same state file simultaneously.

### Why is State Locking important?

It prevents state corruption and infrastructure inconsistency caused by concurrent Terraform operations.

### Why is DynamoDB used?

DynamoDB provides atomic operations and high availability for managing Terraform locks.

### What problem does locking solve?

It prevents multiple engineers from updating infrastructure simultaneously.

### How do S3 and DynamoDB work together?

S3 stores Terraform state, while DynamoDB manages locks to protect that state.

---

## Architect Thinking

S3 stores reality.

DynamoDB protects reality.

Terraform manages reality.

All three together enable enterprise-grade Infrastructure as Code.

