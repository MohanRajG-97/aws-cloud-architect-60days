DAY 32 - TERRAFORM DYNAMIC BLOCKS

Concept Learned
---------------
Terraform Dynamic Blocks
Nested Infrastructure Automation
Security Group Rule Generation
Infrastructure as Data
Reducing Configuration Duplication

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

Allowed Ports List

22
80
443
3306

     ↓

Dynamic Block

     ↓

Security Group Rules Generated

SSH
HTTP
HTTPS
MySQL

Dynamic Block Syntax
--------------------
dynamic "BLOCK_NAME" {

  for_each = COLLECTION

  content {

    ...
  }
}

Enterprise Benefits
-------------------
- Reduces repetitive nested blocks
- Improves maintainability
- Reduces human errors
- Supports scalable infrastructure
- Enables Infrastructure as Data

Dynamic Blocks vs for_each
--------------------------

Dynamic Blocks:
- Create nested blocks
- Used inside resources
- Best for repeated configurations

for_each:
- Creates resources
- Used at resource level
- Best for multiple unique resources

Enterprise Use Cases
--------------------
- Security Group Rules
- IAM Policy Statements
- Route Table Entries
- Load Balancer Listeners
- WAF Rules
- EKS Node Groups

Problems Faced
--------------
No issues encountered.

Lessons Learned
---------------
Dynamic Blocks automate nested configurations.

Updating input data automatically updates infrastructure.

Terraform minimizes manual effort.

Infrastructure should be data-driven.

Interview Questions
-------------------
1. What is a Dynamic Block?
2. Why are Dynamic Blocks important?
3. Difference between Dynamic Blocks and for_each?
4. Why do enterprises use Dynamic Blocks?
5. Give examples of Dynamic Block use cases.

Architect Takeaway
------------------
Beginner:
Writes repetitive blocks manually.

Engineer:
Uses loops for automation.

Architect:
Builds reusable infrastructure patterns that scale efficiently.
