output "instance_ids" {

  value = aws_instance.web[*].id
}

output "instance_public_ips" {

  value = aws_instance.web[*].public_ip
}

output "bucket_names" {

  value = [
    for bucket in aws_s3_bucket.environment_buckets :
    bucket.bucket
  ]
}
