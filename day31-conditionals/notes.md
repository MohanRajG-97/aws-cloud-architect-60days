DAY 31 - TERRAFORM CONDITIONAL EXPRESSIONS

Concept Learned
---------------
Terraform Conditional Expressions
Environment-Aware Infrastructure
Smart Infrastructure Decisions
Cost Optimization Patterns
Production vs Development Logic

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
Environment Variable
     ↓
Conditional Expression
     ↓
DEV  → t3.micro
TEST → t3.micro
PROD → t3.small

Conditional Expression Syntax
-----------------------------
condition ? true_value : false_value

Example:
var.environment == "prod"
? "t3.small"
: "t3.micro"

DEV Results
-----------
Environment: dev
Instance Type: t3.micro

Reason:
Lower cost for development workloads.

PROD Results
------------
Environment: prod
Instance Type: t3.small

Reason:
Higher performance and reliability for production workloads.

Enterprise Usage
----------------
Conditional expressions are commonly used for:

- EC2 Instance Types
- Auto Scaling Capacities
- Backup Policies
- Monitoring Levels
- WAF Enablement
- Multi-AZ Deployments
- Encryption Requirements

Problems Faced
--------------
No major issues encountered.

Lessons Learned
---------------
DEV and PROD should not use identical infrastructure.

Conditional expressions improve flexibility.

Terraform can make intelligent infrastructure decisions.

Cost optimization is important in non-production environments.

Interview Questions
-------------------
1. What is a Terraform Conditional Expression?
2. What is its syntax?
3. Why are conditionals important?
4. Why do enterprises differentiate DEV and PROD?
5. Give enterprise use cases for conditionals.

Architect Takeaway
------------------
Beginner:
Uses the same infrastructure everywhere.

Engineer:
Uses conditional logic.

Architect:
Optimizes infrastructure based on cost, performance, security, and business needs.
