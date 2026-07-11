module "networking" {

  source = "./modules/networking"

  common_tags = local.common_tags
}

module "security" {

  source = "./modules/security"

  vpc_id = module.networking.vpc_id

  common_tags = local.common_tags
}

module "alb" {

  source = "./modules/alb"

  vpc_id = module.networking.vpc_id

  public_subnet_ids = module.networking.public_subnet_ids

  alb_sg_id = module.security.alb_sg_id

  common_tags = local.common_tags
}

module "compute" {

  source = "./modules/compute"

  public_subnet_ids = module.networking.public_subnet_ids

  web_sg_id = module.security.web_sg_id

  target_group_arn = module.alb.target_group_arn

  instance_type = var.instance_type

  common_tags = local.common_tags
}
