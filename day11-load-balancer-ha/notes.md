# Day 11 - Load Balancer + High Availability

## Objective
Implement High Availability architecture using:
- Application Load Balancer (ALB)
- Multiple EC2 Instances
- Multi-AZ deployment
- Target Groups
- Health Checks

---

# Architecture

Internet
↓
Application Load Balancer
↓
--------------------------------
|                              |
EC2-1 (ap-south-1a)      EC2-2 (ap-south-1b)

---

# Components Used

## Networking
- Custom VPC
- Public Subnet A
- Public Subnet B
- Internet Gateway
- Route Tables

## Security Groups
- ALB Security Group
- Web Server Security Group
- Bastion Security Group

## Compute
- EC2 Instance 1
- EC2 Instance 2

## Load Balancing
- Application Load Balancer
- Target Group
- Listener
- Health Checks

---

# Security Design

## ALB Security Group
Allowed:
- HTTP (Port 80) from internet

## Web Server Security Group
Allowed:
- HTTP only from ALB Security Group
- SSH from Bastion Security Group

Learning:
Backend EC2 servers should not be directly exposed to internet in production architecture.

---

# EC2 Configuration

## Apache Installation

Commands used:

```bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
```

## Web Pages

### Server 1
```bash
echo "Server 1" | sudo tee /var/www/html/index.html
```

### Server 2
```bash
echo "Server 2" | sudo tee /var/www/html/index.html
```

---

# Target Group

Created Target Group:
- Protocol: HTTP
- Port: 80
- Target Type: instance

Registered:
- EC2-1
- EC2-2

Health Check Path:
/
```

---

# Load Balancer

Created:
- Application Load Balancer (ALB)

Configured:
- Internet-facing
- Multi-AZ deployment
- Listener on Port 80
- Forward action to Target Group

---

# Failover Testing

Test Performed:
- Stopped one EC2 instance

Result:
- Website continued working through healthy EC2 instance

Learning:
High Availability prevents application downtime during server failure.

---

# Troubleshooting Notes

## Issue 1
Problem:
Target Group showed "unused"

Reason:
ALB listener was not attached yet.

Fix:
Created Listener to forward traffic from ALB to Target Group.

---

## Issue 2
Problem:
Browser could not access EC2 directly.

Reason:
Web Security Group allowed HTTP only from ALB Security Group.

Learning:
This is correct enterprise security architecture.

---

## Issue 3
Problem:
Received "System has not been booted with systemd"

Reason:
Apache commands were executed in CloudShell instead of EC2 instance.

Fix:
SSH into EC2 instance first before running Linux service commands.

---

## Issue 4
Problem:
Command failed due to wrong parameter spelling.

Example:
--protocal

Fix:
Correct parameter:
--protocol

Learning:
AWS CLI commands are case-sensitive and spelling-sensitive.

---

# Key Learnings

- High Availability Architecture
- Multi-AZ Deployment
- Application Load Balancer
- Target Groups
- Health Checks
- Security Group Chaining
- Failover Testing
- Enterprise Web Architecture
- AWS Networking Troubleshooting

---

# Final Result

Successfully implemented:
- Multi-AZ highly available architecture
- Application Load Balancer
- Automatic traffic distribution
- Health check monitoring
- Failover architecture

The application continued working even after one EC2 instance failure.
