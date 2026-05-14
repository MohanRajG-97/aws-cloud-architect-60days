# Day 12 - Auto Scaling Group (ASG)

## Architecture

Internet
↓
Application Load Balancer (ALB)
↓
Auto Scaling Group (ASG)
↓
EC2 Instances

---

## Components Used

- Application Load Balancer
- Target Group
- Launch Template
- Auto Scaling Group
- EC2 Instances
- Security Groups
- User Data Script

---

## User Data Script

```bash
#!/bin/bash
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "Auto Scaling Server" > /var/www/html/index.html Concepts Learned
High Availability
Elastic Infrastructure
Self-Healing Systems
Load Balancing
Launch Templates
Desired Capacity
Health Checks
Infrastructure Automation
Troubleshooting & Fixes
Issue 1 — ALB Targets Unhealthy

Cause:

ASG instances launched without public IPs
Apache health checks failed

Fix:

Created new Launch Template with:
AssociatePublicIpAddress=true
Correct NetworkInterfaces configuration
Issue 2 — Launch Template Conflict

Cause:

Old template versions had conflicting:
SecurityGroupIds
NetworkInterfaces

Fix:

Created clean Launch Template:
day12-template-v2
Issue 3 — ASG Validation Errors

Cause:

Mixed networking configuration inheritance

Fix:

Rebuilt clean ASG-compatible Launch Template
Self-Healing Test

Terminated one EC2 instance manually.

ASG automatically:

detected failure
launched replacement EC2
maintained availability

Website remained accessible during failover.

Final Result
ALB healthy
Auto Scaling working
Self-healing verified
Website accessible successfully
Infrastructure automatically recovered from EC2 failure
