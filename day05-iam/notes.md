# Day 5 - IAM (Identity and Access Management)

## 🔧 Resources Created
- IAM User: day5-user
- IAM Policy: Day5S3ReadPolicy
- Policy Attached to User
- IAM Role: day5-role
- Policy Attached to Role

---

## 📘 Concepts Learned

### 1. IAM
Service to securely control access to AWS resources.

### 2. IAM User
Permanent identity for users.

### 3. IAM Role
Temporary identity used by AWS services (like EC2).

### 4. IAM Policy
JSON document that defines permissions.

### 5. Least Privilege
Grant minimum permissions required.

---

## 🔬 Practical Test

- Launched EC2 with IAM Role
- Connected using EC2 Instance Connect
- Ran:

aws s3 ls

- Successfully listed S3 bucket:
day5-test-mohan-1904

---

## 🧠 Debugging

- Error: AccessDenied (ListAllMyBuckets missing)
- Fix: Added "s3:ListAllMyBuckets" permission to policy

---

## 🏗️ Architecture

EC2 → IAM Role → S3

- No access keys used
- Secure and scalable
