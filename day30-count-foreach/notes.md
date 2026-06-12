DAY 30 - TERRAFORM count AND for_each

Concept Learned
---------------
Terraform count
Terraform for_each
Infrastructure Scaling Patterns
Dynamic Resource Creation
Scalable Infrastructure Design

Commands Used
-------------
terraform init
terraform validate
terraform plan
terraform apply
terraform output
terraform destroy

Architecture
------------
Terraform
     ↓

COUNT
     ↓
EC2-1
EC2-2
EC2-3

FOR_EACH
     ↓
dev bucket
test bucket
prod bucket

Enterprise Usage
----------------
Organizations use count for:

- EC2 Fleets
- NAT Instances
- Bastion Hosts
- EKS Worker Nodes

Organizations use for_each for:

- IAM Users
- Security Groups
- DNS Records
- Environment-specific Resources
- S3 Buckets

This improves scalability and reduces code duplication.

Problems Faced
--------------
Random provider installation failed.

Error:
Failed to install hashicorp/random provider.

Root Cause Analysis
-------------------
CloudShell experienced temporary storage limitations during provider extraction.

The provider version selected initially required additional extraction space.

Correction Applied
------------------
Removed Terraform caches.

Pinned Random provider version:

version = "= 3.6.2"

Re-ran terraform init successfully.

Lessons Learned
---------------
Use count for identical resources.

Use for_each for uniquely identified resources.

Avoid duplicating infrastructure code.

Pin provider versions to ensure consistent deployments.

Clean Terraform caches when introducing new providers in CloudShell environments.

Interview Questions
-------------------
1. What is count in Terraform?
2. What is for_each in Terraform?
3. Difference between count and for_each?
4. When should count be used?
5. When should for_each be used?

Architect Takeaway
------------------
Beginner:
Creates resources manually.

Engineer:
Automates resource creation.

Architect:
Designs scalable infrastructure patterns using reusable code.
