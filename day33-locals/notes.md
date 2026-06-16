DAY 33 - TERRAFORM LOCALS

Concept Learned
---------------
Terraform Locals
Enterprise Configuration Standards
Centralized Configuration Management
Naming Conventions
Enterprise Tagging Strategies

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
Variables
     ↓

Environment

     ↓

Locals

Project Name
Owner
Common Tags
Naming Convention

     ↓

Security Group
EC2 Instance

Locals Used
-----------
project      = cloud-architect
owner        = MohanRaj
environment  = prod

Generated Values
----------------
Name Prefix:
cloud-architect-prod

Security Group:
cloud-architect-prod-sg

EC2 Name:
cloud-architect-prod-ec2

Common Tags
-----------
Project     = cloud-architect
Environment = prod
Owner       = MohanRaj
ManagedBy   = Terraform

Enterprise Benefits
-------------------
- Centralized configuration management
- Consistent naming standards
- Standardized tagging
- Reduced duplication
- Easier maintenance

Variables vs Locals
-------------------
Variables:
- External Inputs
- User supplied

Locals:
- Internal Computation
- Reusable derived values

Enterprise Usage
----------------
Locals commonly manage:

- Naming Standards
- Tagging Policies
- Environment Settings
- Derived Configurations
- Shared Resource Definitions

Problems Faced
--------------
Typographical error encountered:

"esource"

instead of:

"resource"

Root Cause Analysis
-------------------
Minor typing mistake during file creation.

Correction Applied
------------------
Corrected the resource block declaration.

Validation passed successfully afterward.

Lessons Learned
---------------
Define repeated values once.

Reuse Locals throughout Terraform configurations.

Maintain enterprise naming consistency.

Apply organizational tagging standards.

Interview Questions
-------------------
1. What are Terraform Locals?
2. Difference between Variables and Locals?
3. Why are Locals important?
4. Why do enterprises use naming conventions?
5. Give examples of enterprise tags.

Architect Takeaway
------------------
Beginner:
Copies values repeatedly.

Engineer:
Uses Locals.

Architect:
Builds organization-wide standards through centralized configuration.
