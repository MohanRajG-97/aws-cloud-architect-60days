# Day 13 - CloudWatch Monitoring and Alerts

## Objective

Monitor AWS infrastructure using:

- CloudWatch Metrics
- CloudWatch Alarms
- SNS Notifications
- Email Alerts

This project demonstrates real-world infrastructure monitoring and observability.

---

# Architecture

EC2 Instance
↓
CloudWatch Metrics
↓
CloudWatch Alarm
↓
SNS Topic
↓
Email Notification

---

# AWS Resources Used

| Resource | Purpose |
|---|---|
| EC2 Instance | Server for monitoring |
| Apache2 | Web server |
| CloudWatch | Monitoring service |
| CloudWatch Alarm | CPU threshold alert |
| SNS Topic | Notification delivery |
| Email Subscription | Receive alerts |

---

# Infrastructure Details

| Component | Value |
|---|---|
| Instance ID | i-0dfa4292636b9d90a |
| Instance Type | t3.micro |
| VPC | vpc-0ea58f8e325413636 |
| Subnet | subnet-08dd504cff0097181 |
| Security Group | sg-0e0b82779072fc057 |
| KeyPair | day8-key |
| SNS Topic | day13-alerts |

---

# EC2 Launch Command

```bash
aws ec2 run-instances \
--image-id ami-0f58b397bc5c1f2e8 \
--instance-type t3.micro \
--key-name day8-key \
--security-group-ids sg-0e0b82779072fc057 \
--subnet-id subnet-08dd504cff0097181 \
--associate-public-ip-address \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=day13-monitoring-server}]'
```

---

# Apache Installation

## Update Packages

```bash
sudo apt update
```

## Install Apache

```bash
sudo apt install apache2 -y
```

## Start Apache

```bash
sudo systemctl start apache2
```

## Enable Apache

```bash
sudo systemctl enable apache2
```

## Create Webpage

```bash
echo "Day 13 CloudWatch Monitoring" | sudo tee /var/www/html/index.html
```

---

# SNS Topic Creation

```bash
aws sns create-topic \
--name day13-alerts
```

## SNS Topic ARN

```text
arn:aws:sns:ap-south-1:634503647536:day13-alerts
```

---

# Email Subscription

```bash
aws sns subscribe \
--topic-arn arn:aws:sns:ap-south-1:634503647536:day13-alerts \
--protocol email \
--notification-endpoint vijaymohan7418@gmail.com
```

---

# CloudWatch Alarm Creation

```bash
aws cloudwatch put-metric-alarm \
--alarm-name day13-high-cpu \
--metric-name CPUUtilization \
--namespace AWS/EC2 \
--statistic Average \
--period 300 \
--threshold 70 \
--comparison-operator GreaterThanThreshold \
--dimensions Name=InstanceId,Value=i-0dfa4292636b9d90a \
--evaluation-periods 1 \
--alarm-actions arn:aws:sns:ap-south-1:634503647536:day13-alerts \
--unit Percent
```

---

# CPU Stress Testing

## Generate High CPU Usage

```bash
yes > /dev/null &
```

This command continuously generates CPU load to trigger the CloudWatch alarm.

---

# Stop CPU Stress

```bash
pkill -9 yes
```

---

# Alarm States Observed

## Initial State

```text
INSUFFICIENT_DATA
```

## High CPU State

```text
ALARM
```

## Recovery State

```text
OK
```

---

# Troubleshooting and Resolutions

## Issue 1 - t2.micro Not Eligible

### Error

```text
The specified instance type is not eligible for Free Tier
```

### Cause

AWS account Free Tier restrictions.

### Resolution

Used:

```text
t3.micro
```

instead of:

```text
t2.micro
```

---

## Issue 2 - SSH Permission Denied

### Error

```text
Permission denied (publickey)
```

### Cause

Incorrect SSH username.

Initially used:

```text
ec2-user
```

But the EC2 AMI was Ubuntu.

### Resolution

Used correct Ubuntu username:

```bash
ssh -i day8-key.pem ubuntu@65.1.114.182
```

---

## Issue 3 - CloudWatch Alarm Stayed in ALARM State

### Cause

CloudWatch metrics are delayed and evaluated periodically.

### Resolution

Stopped CPU stress process and waited for metric reevaluation.

```bash
pkill -9 yes
```

Alarm eventually returned to:

```text
OK
```

---

# Concepts Learned

- Infrastructure Monitoring
- CloudWatch Metrics
- CloudWatch Alarms
- SNS Notifications
- Observability
- Alert Thresholds
- CPU Monitoring
- Recovery Detection
- AWS Troubleshooting

---

# Real-World Use Cases

CloudWatch is used for:

- Production monitoring
- Server health checks
- Auto Scaling triggers
- Security monitoring
- Failure detection
- Infrastructure observability

---

# Final Result

Successfully built AWS monitoring infrastructure using:

- EC2
- CloudWatch
- SNS
- Email alerts

Successfully triggered and recovered CloudWatch alarms using real CPU stress testing.
