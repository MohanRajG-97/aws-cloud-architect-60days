data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

resource "aws_launch_template" "this" {

  name_prefix = "enterprise-lt"

  image_id = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  key_name = "day28-key"

  vpc_security_group_ids = [
    var.web_sg_id
  ]

  user_data = filebase64("${path.root}/userdata/install.sh")

  tag_specifications {

    resource_type = "instance"

    tags = merge(
      var.common_tags,
      {
        Name = "enterprise-web"
      }
    )
  }
}

resource "aws_autoscaling_group" "this" {

  name = "enterprise-asg"

  min_size = 2

  desired_capacity = 2

  max_size = 4

  vpc_zone_identifier = var.public_subnet_ids

  target_group_arns = [
    var.target_group_arn
  ]

  health_check_type = "ELB"

  launch_template {

    id = aws_launch_template.this.id

    version = "$Latest"
  }

  tag {

    key = "Name"

    value = "enterprise-web"

    propagate_at_launch = true
  }

  tag {

    key = "Environment"

    value = var.common_tags["Environment"]

    propagate_at_launch = true
  }
}
