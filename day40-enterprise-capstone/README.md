# 🚀 Day 40 – Enterprise Terraform Capstone Project

## Production-Grade Highly Available Web Platform on AWS

> A production-inspired AWS infrastructure deployed entirely using Terraform, demonstrating High Availability, Infrastructure as Code (IaC), Auto Scaling, Load Balancing, and Modular Terraform Design.

---

## 📌 Project Overview

This project demonstrates the design and deployment of a highly available web platform on Amazon Web Services (AWS) using **Terraform** as the Infrastructure as Code (IaC) tool.

The objective is to simulate how a real enterprise application is deployed using AWS networking, security, automation, and scalability best practices.

Instead of manually provisioning AWS resources through the console, the complete infrastructure is created, managed, and destroyed using reusable Terraform modules.

This project focuses on designing infrastructure that is:

- Highly Available
- Fault Tolerant
- Modular
- Scalable
- Easy to Maintain
- Cost Conscious

The deployment follows production-inspired AWS architecture principles by separating networking, security, compute, and load balancing into reusable Terraform modules.

---

# 🎯 Project Objectives

The primary objectives of this capstone project are:

- Build AWS infrastructure using Terraform
- Design a reusable modular architecture
- Deploy a custom VPC
- Implement Multi-Availability Zone networking
- Configure an Application Load Balancer
- Deploy an Auto Scaling Group
- Automate EC2 provisioning using User Data
- Demonstrate self-healing infrastructure
- Validate High Availability
- Practice production-style Infrastructure as Code

---

# ⭐ Key Features

- ✅ Infrastructure as Code (Terraform)
- ✅ Modular Terraform Design
- ✅ Custom Amazon VPC
- ✅ Two Public Subnets
- ✅ Two Private Subnets
- ✅ Internet Gateway
- ✅ NAT Gateway
- ✅ Route Tables
- ✅ Security Groups
- ✅ Launch Template
- ✅ Auto Scaling Group
- ✅ Application Load Balancer
- ✅ Target Group
- ✅ Health Checks
- ✅ User Data Automation
- ✅ High Availability
- ✅ Self-Healing Infrastructure
- ✅ Cost Cleanup using Terraform Destroy

---
# 🏗 Enterprise Architecture

The infrastructure is designed using a production-inspired architecture that emphasizes High Availability, scalability, modularity, and fault tolerance.

The application is deployed inside a dedicated Amazon Virtual Private Cloud (VPC) and spans multiple Availability Zones to ensure continuous availability even if one Availability Zone becomes unavailable.

Incoming user traffic is distributed by an **Application Load Balancer (ALB)** across multiple EC2 web servers managed by an **Auto Scaling Group (ASG)**.

The infrastructure is completely provisioned using Terraform modules, enabling reusable, maintainable, and consistent deployments.

---

# 🖼 Architecture Diagram

> Replace the image below with the architecture diagram created for this project.

![Day 40 Enterprise Architecture](../Architecture/Day40-Enterprise-Capstone-Architecture.png)

---

# 🌐 Architecture Flow

```text
                   Users
                      │
                      ▼
                  Internet
                      │
                      ▼
             Internet Gateway
                      │
                      ▼
        Application Load Balancer
                      │
                      ▼
              Target Group
                      │
         ┌────────────┴────────────┐
         ▼                         ▼
  EC2 Web Server 1          EC2 Web Server 2
   (AZ-1a)                     (AZ-1b)
         ▲                         ▲
         └────────────┬────────────┘
                      │
             Auto Scaling Group
                      │
                 Launch Template
```

---

# 📖 Architecture Explanation

### Amazon VPC

A dedicated Amazon Virtual Private Cloud provides complete network isolation and allows full control over IP addressing, routing, and security boundaries.

---

### Public Subnets

Two public subnets are deployed across different Availability Zones.

These host the Application Load Balancer and provide public internet access through the Internet Gateway.

---

### Private Subnets

Two private subnets are created to demonstrate an enterprise-ready network layout.

Although the EC2 instances for this project are launched in public subnets for demonstration purposes, production workloads would normally place application servers inside private subnets.

---

### Application Load Balancer

The ALB acts as the single public entry point for the application.

Responsibilities include:

- Distributing traffic
- Health checking EC2 instances
- Removing unhealthy instances from service
- Providing High Availability

---

### Target Group

The Target Group continuously monitors the health of registered EC2 instances.

Only healthy instances receive production traffic.

---

### Auto Scaling Group

The Auto Scaling Group maintains the desired number of running EC2 instances.

Configuration:

- Minimum Capacity: 2
- Desired Capacity: 2
- Maximum Capacity: 4

If an EC2 instance fails, the Auto Scaling Group automatically launches a replacement instance.

---

### Launch Template

The Launch Template defines:

- Amazon Linux 2023 AMI
- Instance Type
- Security Group
- User Data Script
- EC2 Configuration

This ensures every replacement instance is identical to the original deployment.

---
# ☁️ AWS Services Used

| AWS Service | Purpose |
|-------------|---------|
| Amazon VPC | Provides an isolated virtual network for the infrastructure. |
| Public Subnets | Host internet-facing resources such as the Application Load Balancer. |
| Private Subnets | Reserved for production-style application or database workloads. |
| Internet Gateway | Enables internet connectivity for resources in public subnets. |
| NAT Gateway | Allows private subnet resources to access the internet securely without exposing them publicly. |
| Route Tables | Define how traffic flows between subnets and external networks. |
| Security Groups | Act as virtual firewalls controlling inbound and outbound traffic. |
| Amazon EC2 | Hosts the Apache web application. |
| Launch Template | Defines a reusable blueprint for EC2 instances. |
| Auto Scaling Group | Automatically maintains the desired number of EC2 instances and replaces unhealthy ones. |
| Application Load Balancer (ALB) | Distributes incoming HTTP traffic across multiple EC2 instances. |
| Target Group | Monitors instance health and routes traffic only to healthy targets. |
| User Data | Automatically installs and configures Apache during instance launch. |
| Terraform | Automates provisioning and management of AWS infrastructure. |

---

# 📂 Terraform Module Design

The infrastructure is divided into reusable modules to follow enterprise Infrastructure as Code (IaC) best practices.

Instead of placing all resources in a single `main.tf` file, the project separates responsibilities into dedicated modules.

This improves:

- Reusability
- Scalability
- Maintainability
- Team Collaboration
- Code Readability
- Enterprise Standardization

---

## 📁 Root Module

The Root Module acts as the orchestration layer.

Responsibilities:

- Calls all child modules
- Passes variables between modules
- Combines outputs
- Controls deployment order

---

## 🌐 Networking Module

Responsible for provisioning the complete network layer.

Resources created:

- Custom VPC
- Internet Gateway
- Two Public Subnets
- Two Private Subnets
- NAT Gateway
- Public Route Table
- Private Route Table
- Route Table Associations

---

## 🔐 Security Module

Responsible for securing the infrastructure.

Resources created:

- Application Load Balancer Security Group
- EC2 Web Server Security Group

Security Design:

- HTTP allowed from the internet only to the ALB
- EC2 instances receive HTTP traffic only from the ALB Security Group
- SSH access is intended to be restricted to trusted administrative sources in production

---

## ⚖️ Load Balancer Module

Responsible for exposing the application to end users.

Resources created:

- Application Load Balancer
- Target Group
- Listener
- Health Check Configuration

The ALB continuously monitors the health of EC2 instances and forwards traffic only to healthy targets.

---

## 💻 Compute Module

Responsible for the compute layer.

Resources created:

- Launch Template
- Auto Scaling Group
- EC2 Instances
- User Data Bootstrap

The Auto Scaling Group automatically replaces failed EC2 instances to maintain application availability.

---
# 🚀 Deployment Workflow

The complete infrastructure is deployed using Terraform following a standard Infrastructure as Code (IaC) workflow.

---

## Step 1 — Initialize Terraform

```bash
terraform init
```

Initializes the Terraform working directory and downloads all required providers and modules.

---

## Step 2 — Validate the Configuration

```bash
terraform validate
```

Checks the Terraform configuration for syntax and logical consistency before deployment.

---

## Step 3 — Review the Execution Plan

```bash
terraform plan
```

Displays the execution plan, allowing verification of all resources before they are created.

---

## Step 4 — Deploy the Infrastructure

```bash
terraform apply
```

Terraform provisions the complete AWS infrastructure, including networking, security, compute, and load balancing resources.

---

# ✅ Infrastructure Validation

After deployment, each component was verified using AWS CLI.

| Component | Status |
|-----------|--------|
| Custom VPC | ✅ Verified |
| Public Subnets | ✅ Verified |
| Private Subnets | ✅ Verified |
| Internet Gateway | ✅ Verified |
| NAT Gateway | ✅ Verified |
| Route Tables | ✅ Verified |
| Security Groups | ✅ Verified |
| Launch Template | ✅ Verified |
| Auto Scaling Group | ✅ Verified |
| Application Load Balancer | ✅ Verified |
| Target Group | ✅ Verified |
| EC2 Instances | ✅ Verified |
| Apache Web Server | ✅ Verified |
| Website Availability | ✅ Verified |

---

# 🌍 Website Verification

The website was accessed using the DNS name of the Application Load Balancer.

Expected Output:

```text
Enterprise Web Platform

Instance: i-xxxxxxxxxxxxxxxxx
```

Refreshing the page multiple times displayed different EC2 Instance IDs, confirming that the Application Load Balancer was successfully distributing traffic between multiple backend instances.

---

# ❤️ Health Check Validation

The Target Group continuously monitored the health of all registered EC2 instances.

Health Check Configuration:

- Protocol: HTTP
- Port: 80
- Path: /
- Success Code: 200

Only healthy EC2 instances received application traffic.

---

# 🔄 High Availability Demonstration

To validate self-healing capabilities, one running EC2 instance was intentionally terminated.

Terraform deployment remained unchanged while AWS Auto Scaling automatically:

1. Detected the unhealthy instance.
2. Launched a replacement EC2 instance.
3. Registered the new instance with the Target Group.
4. Waited until the health checks passed.
5. Continued serving traffic through the Application Load Balancer.

Result:

- ✅ No manual intervention required.
- ✅ Application remained available.
- ✅ High Availability successfully demonstrated.

---

# 💰 Cost Optimization

After completing all validation tests, the infrastructure was removed using:

```bash
terraform destroy
```

Terraform successfully deleted:

- VPC
- Subnets
- Internet Gateway
- NAT Gateway
- Security Groups
- Launch Template
- Auto Scaling Group
- Application Load Balancer
- Target Group
- EC2 Instances

This ensured that no unnecessary AWS charges continued after project completion.

---
# 📸 Project Screenshots

The following screenshots document the complete lifecycle of the project, from infrastructure planning to deployment, validation, failover testing, and cleanup.

| Screenshot | Description |
|------------|-------------|
| 01 | Terraform Plan |
| 02 | Terraform Apply |
| 03 | Project Structure |
| 04 | Terraform Modules |
| 05 | Root Module |
| 06 | User Data Script |
| 07 | Terraform Outputs |
| 08 | VPC Verification |
| 09 | Auto Scaling Group Verification |
| 10 | Application Load Balancer Verification |
| 11 | Target Group Health Check |
| 12 | Website Verification |
| 13 | Running EC2 Instances |
| 14 | Instance Termination Test |
| 15 | Auto Scaling Replacement |
| 16 | Target Health After Recovery |
| 17 | High Availability Verification |
| 18 | Terraform Destroy Plan |
| 19 | Terraform Destroy Completed |

---

# 🎤 Interview Discussion Points

This project helped me understand and implement several enterprise cloud concepts.

### Basic Questions

- What is Infrastructure as Code (IaC)?
- Why is Terraform used instead of manually creating resources?
- What is the purpose of an Amazon VPC?
- What is the difference between a Public Subnet and a Private Subnet?
- Why do we use Security Groups?

### Intermediate Questions

- Why did you use an Application Load Balancer?
- Why is an Auto Scaling Group required?
- How does the Target Group health check work?
- What happens if one EC2 instance becomes unhealthy?
- Why is Terraform modularization considered an enterprise best practice?

### Advanced Questions

- Why would production web servers normally be placed in private subnets?
- How would you secure SSH access in a production environment?
- How would you reduce AWS costs while maintaining High Availability?
- How would you extend this architecture for a three-tier application?
- How would you deploy this architecture across multiple AWS Regions for Disaster Recovery?
- How would you integrate CloudWatch, SNS, and WAF into this design?
- If one Availability Zone fails completely, how does this architecture continue serving users?

---

# 📚 Lessons Learned

Through this capstone project, I gained practical experience in:

- Designing production-inspired AWS infrastructure
- Building reusable Terraform modules
- Deploying highly available applications
- Implementing Auto Scaling and Load Balancing
- Configuring health checks
- Performing failover testing
- Applying Infrastructure as Code principles
- Managing infrastructure lifecycle using Terraform
- Cleaning up cloud resources to avoid unnecessary costs

---

# 🚀 Future Improvements

Future enhancements for this project include:

- HTTPS using AWS Certificate Manager (ACM)
- Route 53 custom domain integration
- AWS WAF for web application protection
- CloudWatch dashboards and alarms
- SNS notifications
- Bastion Host for secure administration
- EC2 instances in private subnets
- Remote Terraform backend using Amazon S3 and DynamoDB
- GitHub Actions CI/CD pipeline
- Blue/Green deployment strategy
- Containerization using Amazon ECS or Amazon EKS

---

# 👨‍💻 Author

**Mohan Raj G**

AWS Cloud Engineer / Solutions Architect Journey

GitHub: https://github.com/MohanRajG-97

---

# ⭐ Conclusion

This capstone project demonstrates the design, deployment, validation, and safe removal of a production-inspired AWS infrastructure using Terraform.

It showcases enterprise concepts including modular Infrastructure as Code, High Availability, Auto Scaling, Application Load Balancing, health checks, and self-healing architecture.

The project strengthened my understanding of AWS architecture, Terraform best practices, and production-style cloud infrastructure deployment.
