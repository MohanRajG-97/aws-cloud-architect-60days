terraform {
  backend "s3" {
    bucket = "mohanraj-day24-tfstate-20260606"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
