locals {

  project = "cloud-architect"

  owner = "MohanRaj"

  common_tags = {

    Project     = local.project

    Environment = var.environment

    Owner       = local.owner

    ManagedBy   = "Terraform"
  }

  name_prefix = "${local.project}-${var.environment}"
}
