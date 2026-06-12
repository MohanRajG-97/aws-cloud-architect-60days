resource "aws_security_group" "web" {

  name_prefix = "day30-sg"

  vpc_id = data.aws_vpc.default.id

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {

  count = 3

  ami           = data.aws_ami.amazon_linux.id

  instance_type = "t3.micro"

  subnet_id = data.aws_subnets.default.ids[0]

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  key_name = "day28-key"

  tags = {
    Name = "Day30-EC2-${count.index}"
  }
}

resource "random_integer" "suffix" {

  for_each = toset([
    "dev",
    "test",
    "prod"
  ])

  min = 10000
  max = 99999
}

resource "aws_s3_bucket" "environment_buckets" {

  for_each = toset([
    "dev",
    "test",
    "prod"
  ])

  bucket = "mohanraj-${each.key}-day30-${random_integer.suffix[each.key].result}"

  tags = {
    Environment = each.key
  }
}
