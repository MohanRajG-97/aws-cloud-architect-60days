terraform {
  backend "s3" {
    bucket         = "mohanraj-day25-tfstate-20260606"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
  }
}
