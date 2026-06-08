terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.100"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

resource "aws_s3_bucket" "environment_bucket" {

  bucket = "mohanraj-${terraform.workspace}-bucket-${random_integer.suffix.result}"

  tags = {
    Environment = terraform.workspace
  }
}
