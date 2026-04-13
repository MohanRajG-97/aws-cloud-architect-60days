 Day 3 - EC2

## Created:
- Key Pair
- Security Group
- EC2 Instance

## Connected via SSH
Successfully connected to the EC2 instance using SSH.

## Commands used:

### Launch EC2 Instance
aws ec2 run-instances \
--image-id ami-007e51e00fe1e2173 \
--count 1 \
--instance-type t3.micro \
--key-name day3-key \
--security-group-ids sg-0352708e78d8bd50f \
--subnet-id subnet-01f8e4b7b786e3cda

### Connect via SSH
ssh -i day3-key.pem ec2-user@52.66.243.67
