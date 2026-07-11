resource "aws_lb" "this" {

  name = "enterprise-alb"

  internal = false

  load_balancer_type = "application"

  security_groups = [
    var.alb_sg_id
  ]

  subnets = var.public_subnet_ids

  tags = merge(
    var.common_tags,
    {
      Name = "enterprise-alb"
    }
  )
}

resource "aws_lb_target_group" "this" {

  name = "enterprise-tg"

  port = 80

  protocol = "HTTP"

  vpc_id = var.vpc_id

  health_check {

    enabled = true

    path = "/"

    healthy_threshold = 2

    unhealthy_threshold = 2

    interval = 30

    timeout = 5

    matcher = "200"
  }

  tags = merge(
    var.common_tags,
    {
      Name = "enterprise-tg"
    }
  )
}

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.this.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.this.arn
  }
}
