terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.100"
    }

    time = {
      source  = "hashicorp/time"
      version = "~> 0.12"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
