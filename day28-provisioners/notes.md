DAY 28 - TERRAFORM PROVISIONERS + POST-DEPLOYMENT AUTOMATION

## Concepts Learned

* Terraform Provisioners
* local-exec Provisioner
* remote-exec Provisioner
* Post-Deployment Automation
* SSH Connectivity
* Terraform Taint
* Enterprise Configuration Strategies

## Commands Used

terraform init
terraform validate
terraform plan
terraform apply
terraform taint
terraform destroy
terraform output

## AWS Verification Commands

aws ec2 describe-instances
curl http://<PUBLIC-IP>
ssh -i ~/day28-key.pem ubuntu@<PUBLIC-IP>
sudo systemctl status apache2

## Architecture

Terraform
↓
Create Security Group
↓
Create EC2 Instance
↓
local-exec
↓
deployment.log

Terraform
↓
SSH into EC2
↓
remote-exec
↓
Install Apache
↓
Start Apache
↓
Create index.html
↓
Website Available

## Enterprise Usage

Provisioners are useful for:

* Legacy Infrastructure
* Existing Enterprise Projects
* Learning Terraform Concepts

Modern enterprises prefer:

Terraform
↓
Infrastructure Provisioning
↓
User Data / Cloud-init / SSM / Ansible
↓
Self-configuring Infrastructure

This approach provides:

* Better Reliability
* Better Scalability
* Immutable Infrastructure
* Reduced SSH Dependency

## Problems Faced

1. CloudShell storage issue during provider installation.
2. Wrong SSH username used (ec2-user).
3. Incorrect key pair reference (day3-key not found).
4. remote-exec did not execute after configuration update.
5. remote-exec interrupted during execution.

## Root Cause Analysis

* AWS Provider v6 consumed excessive CloudShell storage.
* Ubuntu AMI requires ubuntu user instead of ec2-user.
* Existing EC2 instance was created before remote-exec block existed.
* Terraform interrupted during provisioning.

## Corrections Applied

* Pinned AWS provider version to ~> 5.100.
* Created new key pair: day28-key.
* Updated SSH user to ubuntu.
* Used terraform taint aws_instance.web.
* Re-ran terraform apply successfully.

## Lessons Learned

* Always pin provider versions.
* Verify AMI operating system before SSH.
* Provisioners should be minimized in production.
* User Data is usually a better approach.
* Troubleshoot using evidence instead of assumptions.

## Interview Questions

1. What is a Terraform Provisioner?
2. What is local-exec?
3. What is remote-exec?
4. Why are Provisioners considered a last resort?
5. Why is User Data preferred over Provisioners?
6. What alternatives exist to Provisioners?
7. What happens if remote-exec fails?
8. What is terraform taint?

## Architect Takeaway

Beginner:
Creates Infrastructure.

Engineer:
Automates Infrastructure Configuration.

Architect:
Designs self-healing, immutable infrastructure while minimizing Provisioner dependencies.

