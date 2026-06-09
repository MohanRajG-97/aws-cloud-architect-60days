resource "aws_security_group" "web_sg" {

  name = "day28-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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

  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t3.micro"

  key_name = "day28-key"

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  provisioner "local-exec" {

    command = "echo EC2_CREATED >> deployment.log"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/day28-key.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {

    inline = [
      "sudo apt update -y",
      "sudo apt install apache2 -y",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2",
      "echo '<h1>Day 28 Provisioner</h1>' | sudo tee /var/www/html/index.html"
    ]
  }

  tags = {
    Name = "Day28-Provisioner-EC2"
  }
}
