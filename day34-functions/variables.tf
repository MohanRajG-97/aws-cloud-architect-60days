variable "environment" {
  default = "prod"
}

variable "project" {
  default = "cloud-architect"
}

variable "owners" {
  type = list(string)

  default = [
    "MohanRaj",
    "DevOpsTeam"
  ]
}

variable "common_tags" {
  type = map(string)

  default = {
    ManagedBy = "Terraform"
    Department = "Cloud"
  }
}

variable "environment_tags" {
  type = map(string)

  default = {
    Environment = "Prod"
    CostCenter = "IT"
  }
}
