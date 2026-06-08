# Day 26 – Terraform Workspaces and Multi-Environment Infrastructure

## Objective

Learn how Terraform Workspaces allow multiple environments to be managed using the same Terraform codebase.

---

## Key Concepts Learned

### What is a Terraform Workspace?

A Terraform Workspace allows separate state files to be maintained using a single Terraform configuration.

Example:

* default
* dev
* prod

Each workspace maintains its own infrastructure state.

---

### Why Workspaces Are Important

Benefits:

* Reuse the same Terraform code
* Separate environments safely
* Reduce code duplication
* Simplify infrastructure management

---

### Environment Separation

Development (DEV)

* Used by developers
* Frequent changes
* Lower cost resources

Production (PROD)

* Used by customers
* Stable infrastructure
* Higher reliability requirements

---

## Hands-On Activities Completed

### Terraform Initialization

* terraform init
* terraform validate

### Workspace Management

* Created DEV workspace
* Created PROD workspace
* Switched between workspaces
* Verified workspace isolation

### Infrastructure Deployment

DEV Bucket:

* mohanraj-dev-bucket-25290

PROD Bucket:

* mohanraj-prod-bucket-77202

### State Isolation Verification

Verified that:

* DEV workspace maintained separate state
* PROD workspace maintained separate state
* Same Terraform code produced different infrastructure

### Resource Cleanup

Destroyed:

* DEV infrastructure
* PROD infrastructure

Verified successful cleanup.

---

## Real-World Enterprise Usage

Organizations commonly maintain:

* Development Environment
* Testing Environment
* Production Environment

Terraform Workspaces help manage these environments using a shared codebase while maintaining isolated state files.

---

## Troubleshooting Experience

Encountered AWS CloudShell storage limitations during provider installation.

Resolved by:

* Running git gc --prune=now
* Removing .terraform directory after completion
* Creating .gitignore to exclude Terraform provider binaries

This reduced repository storage consumption and allowed Terraform initialization to succeed.

---

## Architect Takeaway

Same Code

↓

Multiple Workspaces

↓

Separate State Files

↓

Independent Environments

This pattern enables safe and scalable infrastructure management across Development and Production environments.

