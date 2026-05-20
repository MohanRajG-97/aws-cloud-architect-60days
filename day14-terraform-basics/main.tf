provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "day14_bucket" {
  bucket = "mohanraj-day14-tf-bucket-98765"

  tags = {
    Name        = "Day14TerraformBucket"
    Environment = "Dev"
  }
}
