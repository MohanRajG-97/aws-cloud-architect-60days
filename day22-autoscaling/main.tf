resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Day22-VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "Day22-Public-Subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Day22-IGW"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Day22-Public-RT"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_security_group" "web_sg" {
  name   = "day22-web-sg"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH Access"
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

  tags = {
    Name = "Day22-Web-SG"
  }
}
resource "aws_launch_template" "web_template" {
  name_prefix   = "day22-template"
  image_id      = "ami-0e35ddab05955cf57"
  instance_type = "t3.micro"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.web_sg.id]
  }

  user_data = base64encode(<<-EOT
#!/bin/bash
cd /home/ec2-user
echo "<h1>Day 22 Auto Scaling Server</h1>" > index.html
nohup python3 -m http.server 80 &
EOT
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Day22-ASG-Instance"
    }
  }
}
resource "aws_autoscaling_group" "web_asg" {
  desired_capacity = 1
  max_size         = 2
  min_size         = 1

  vpc_zone_identifier = [aws_subnet.public_subnet.id]

  launch_template {
    id      = aws_launch_template.web_template.id
    version = "$Latest"
  }

  health_check_type = "EC2"

  tag {
    key                 = "Name"
    value               = "Day22-ASG-EC2"
    propagate_at_launch = true
  }
}
