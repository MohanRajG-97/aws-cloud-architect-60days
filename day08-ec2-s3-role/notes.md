# Day 8 - EC2 to S3 using IAM Role

## 🎯 Objective

Enable secure access from EC2 to S3 without using access keys by leveraging IAM Roles (best practice in production environments).

---

## 🏗️ Architecture

EC2 → IAM Role → Temporary Credentials → S3

* No hardcoded credentials
* Secure and auto-rotating access

---

## 🔧 Resources Created

### 1. IAM Role

* Name: Day8EC2S3Role
* Permission: AmazonS3ReadOnlyAccess
* Trust Policy: Allows EC2 to assume the role

### 2. Instance Profile

* Name: Day8InstanceProfile
* Attached Role: Day8EC2S3Role

### 3. EC2 Instance

* Instance Type: t3.micro
* IAM Role attached during launch
* Security Group: SSH (port 22 enabled)

---

## 🧪 Verification Commands

### 1. Check Identity (IAM Role)

```bash
aws sts get-caller-identity
```

**Output:**

```
arn:aws:sts::634503647536:assumed-role/Day8EC2S3Role/i-xxxxxxxxxxxx
```

---

### 2. List S3 Buckets

```bash
aws s3 ls
```

**Output:**

```
2026-04-22 mohanraj-day7-s3-unique-98765
```

---

### 3. Access Specific Bucket

```bash
aws s3 ls s3://mohanraj-day7-s3-unique-98765/
```

**Output:**

```
(empty or file list)
```

---

## ❗ Issues Faced & Fixes

### 1. AMI Not Found

* Cause: Region mismatch
* Fix: Retrieved correct AMI using `describe-images`

### 2. Key Pair Not Found

* Cause: Key didn’t exist in region
* Fix: Created new key pair (`day8-key.pem`)

### 3. Instance Type Not Eligible

* Cause: `t2.micro` not supported
* Fix: Used `t3.micro`

### 4. Bucket Not Found

* Cause: Wrong bucket name used
* Fix: Used correct bucket `mohanraj-day7-s3-unique-98765`

---

## 🧠 Key Concepts Learned

* IAM Role provides secure, temporary credentials
* EC2 uses Instance Metadata Service (IMDS) to fetch credentials
* No need to store access keys inside EC2
* Roles follow least privilege principle

---

## 📌 Interview Questions & Answers

### 1. What is an IAM Role?

An IAM Role is a set of permissions that can be assumed by AWS services like EC2 to securely access resources without long-term credentials.

---

### 2. Why avoid access keys in EC2?

Access keys are long-term and can be leaked. IAM roles use temporary credentials, improving security.

---

### 3. What is an Instance Profile?

An Instance Profile is a container for an IAM Role that allows it to be attached to an EC2 instance.

---

### 4. How does EC2 get permissions without keys?

EC2 retrieves temporary credentials from the Instance Metadata Service using the IAM Role.

---

### 5. What is the advantage of temporary credentials?

They expire automatically, rotate frequently, and reduce the risk of unauthorized access.

---

## ✅ Final Result

EC2 successfully accessed S3 without using access keys by leveraging IAM Role and temporary credentials.

---

