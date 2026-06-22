module "web_server" {

  source = "./modules/ec2"

  instance_name = "day39-web"

  instance_type = "t3.micro"

  environment = "dev"
}

module "app_server" {

  source = "./modules/ec2"

  instance_name = "day39-app"

  instance_type = "t3.micro"

  environment = "prod"
}
