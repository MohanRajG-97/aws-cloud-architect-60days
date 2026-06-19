# Day 36 - Terraform Lifecycle Rules + Production Safety Controls

## Objective

Learn Terraform lifecycle rules used to protect and manage production infrastructure safely.

## Lifecycle Rules Learned

### prevent_destroy

Prevents accidental deletion of critical resources.

Example:

lifecycle {
prevent_destroy = true
}

Use Cases:

* Production S3 Buckets
* Databases
* Terraform State Buckets
* Critical IAM Roles

### create_before_destroy

Creates replacement resources before deleting old ones.

Benefits:

* Reduces downtime
* Safer infrastructure replacement
* Blue/Green style replacement strategy

### ignore_changes

Allows Terraform to ignore specific attributes modified outside Terraform.

Example:

lifecycle {
ignore_changes = [tags]
}

Use Cases:

* Monitoring tags
* Security automation tags
* CMDB integrations

## Lab Results

Resources Created:

* EC2 Instance
* Security Group
* S3 Bucket

Lifecycle Tests:

* prevent_destroy: Passed
* ignore_changes: Passed
* create_before_destroy: Configured and validated

## Key Learning

Lifecycle rules help protect production environments from accidental deletion, unnecessary drift, and downtime during infrastructure changes.

