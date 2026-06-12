DAY 29 - TERRAFORM DATA SOURCES

Concept Learned
---------------
Terraform Data Sources
Dynamic Infrastructure Discovery
Avoiding Hardcoded Values
Reading Existing Infrastructure
Enterprise Infrastructure Reuse

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
Discover Default VPC
     ↓
Discover Existing Subnets
     ↓
Discover Latest Amazon Linux AMI
     ↓
Create Security Group
     ↓
Launch EC2

Data Sources Used
-----------------
aws_vpc
aws_subnets
aws_ami

Enterprise Usage
----------------
Organizations commonly use Data Sources for:

- Existing VPCs
- Existing IAM Roles
- Existing Route Tables
- Existing Hosted Zones
- Existing ACM Certificates
- Existing AMIs

This reduces hardcoding and improves portability.

Problems Faced
--------------
Minor syntax issue found in outputs.tf.

Error:
"utput" was typed instead of "output".

Root Cause Analysis
-------------------
Typographical error during file creation.

Correction Applied
------------------
Corrected:

utput

to:

output

Validation passed successfully afterward.

Lessons Learned
---------------
Avoid hardcoding AWS resource IDs.

Data Sources improve reusability.

Terraform can discover infrastructure dynamically.

Validate configurations before deployment.

Interview Questions
-------------------
1. What is a Terraform Data Source?
2. Difference between Resource and Data Source?
3. Why avoid hardcoding?
4. Why are Data Sources important?
5. Give examples of enterprise Data Sources.

Architect Takeaway
------------------
Beginner:
Hardcodes IDs.

Engineer:
Discovers infrastructure dynamically.

Architect:
Builds reusable infrastructure adaptable across environments.
