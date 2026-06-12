terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.100"
    }

    random = {
      source  = "hashicorp/random"
      version = "= 3.6.2"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

provider "random" {}
