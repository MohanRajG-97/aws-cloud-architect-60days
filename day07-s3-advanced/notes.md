# Day 7 - S3 Advanced (Versioning + Static Website)

## 🔹 Features Implemented
- Enabled S3 Versioning
- Uploaded multiple versions of object
- Verified version history
- Tested delete marker (data recovery)
- Hosted static website using S3

---

## 🔹 Architecture Flow
User → Internet → S3 → Static Website → Browser

---

## 🔹 Commands Used

```bash
aws s3api put-bucket-versioning \
--bucket mohanraj-day7-s3-unique-98765 \
--versioning-configuration Status=Enabled

aws s3api list-object-versions \
--bucket mohanraj-day7-s3-unique-98765

aws s3 website s3://mohanraj-day7-s3-unique-98765/ \
--index-document index.html
