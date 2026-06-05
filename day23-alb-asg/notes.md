# Day 23 — Application Load Balancer (ALB) + Auto Scaling Group (ASG)

## What is an Application Load Balancer (ALB)?

Application Load Balancer distributes incoming HTTP/HTTPS traffic across multiple backend servers.

Benefits:

* High Availability
* Fault Tolerance
* Traffic Distribution
* Scalability
* Health Monitoring

---

## What is a Target Group?

A Target Group is a collection of backend servers that receive traffic from the Load Balancer.

Example:

ALB
↓
Target Group
↓
EC2-1
EC2-2

ALB forwards traffic to healthy targets inside the Target Group.

---

## What is a Health Check?

Health Checks continuously verify whether backend servers are healthy.

If a server fails:

* Traffic stops
* Requests are redirected to healthy servers

This improves availability and reliability.

---

## What is Auto Scaling Group (ASG)?

ASG automatically maintains the desired number of EC2 instances.

Functions:

* Launch new instances
* Replace failed instances
* Maintain desired capacity
* Improve availability

---

## What is High Availability?

High Availability means applications remain accessible even during infrastructure failures.

Today's architecture provides:

* Multiple EC2 instances
* Load Balancing
* Self-Healing Infrastructure

---

## Architecture Built Today

Internet
↓
Application Load Balancer
↓
Target Group
↓
Auto Scaling Group
↓
EC2 Instance 1
EC2 Instance 2

---

## Self-Healing Demonstration

Original Instances:

* i-017992c853a2821d2
* i-09f3e5cb3dc5bd6fb

Terminated:

* i-017992c853a2821d2

Replacement Created:

* i-032ea60495900e6a0

Result:

ASG automatically replaced the failed server.

---

## Website Verification

ALB DNS:

day23-alb-89421532.ap-south-1.elb.amazonaws.com

Website Output:

Day 23 ALB Architecture

---

## Important Concepts Learned

* Application Load Balancer
* Target Groups
* Health Checks
* Launch Templates
* Auto Scaling Groups
* High Availability
* Fault Tolerance
* Self-Healing Infrastructure
* Infrastructure as Code

---

## Real Enterprise Understanding

Today's architecture resembles production environments used by:

* E-commerce platforms
* Banking applications
* SaaS products
* Enterprise web applications

This architecture can survive server failures without application downtime.
