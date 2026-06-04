# Day 22 — Terraform Auto Scaling Group (ASG) & Self-Healing Infrastructure

## What is Auto Scaling Group (ASG)?

Auto Scaling Group automatically maintains the desired number of EC2 instances.

It can:

* launch new instances
* replace failed instances
* maintain availability
* automatically recover infrastructure

ASG helps build highly available applications.

---

## What is a Launch Template?

Launch Template is a reusable EC2 blueprint.

It contains:

* AMI
* Instance Type
* Security Groups
* User Data
* Storage configuration

Auto Scaling Groups use Launch Templates to create EC2 instances automatically.

---

## What is Desired Capacity?

Desired Capacity defines how many EC2 instances should be running.

Today:

* Desired Capacity = 1

Meaning:

ASG always tries to keep one healthy server running.

---

## What is Minimum Size?

Minimum Size defines the lowest number of EC2 instances allowed.

Today:

* Min Size = 1

Meaning:

ASG never allows infrastructure to drop below one server.

---

## What is Maximum Size?

Maximum Size defines the highest number of EC2 instances allowed.

Today:

* Max Size = 2

Meaning:

ASG can scale up to two servers if required.

---

## What is User Data Automation?

User Data is a startup script executed automatically during EC2 launch.

Today User Data:

* created webpage
* started Python web server
* configured application automatically

without manual login.

---

## What is Self-Healing Infrastructure?

Self-Healing Infrastructure automatically replaces unhealthy resources.

Example:

EC2 Failure
↓
ASG Detects Failure
↓
Launch Template Used
↓
New EC2 Created
↓
Service Restored

No manual intervention is required.

---

## What is High Availability?

High Availability means applications remain available even when failures occur.

Auto Scaling improves availability by automatically replacing failed instances.

---

## Important Concepts Learned

* Launch Templates
* Auto Scaling Groups
* Desired Capacity
* Minimum Capacity
* Maximum Capacity
* User Data Automation
* EC2 Bootstrap
* Self-Healing Infrastructure
* High Availability
* Infrastructure as Code

---

## Real Enterprise Understanding

Today we automated:

* VPC networking
* public subnet architecture
* security group configuration
* launch template creation
* auto scaling deployment
* automated server provisioning
* self-healing infrastructure

using Terraform Infrastructure as Code.

---

## Self-Healing Demonstration

Original Instance:

* i-00f3e9702b80dde1c

Instance Terminated

Auto Scaling Group created:

* i-08e621c81a704bcf9

Result:

Infrastructure automatically recovered without manual EC2 creation.

This is a core enterprise cloud architecture pattern.

