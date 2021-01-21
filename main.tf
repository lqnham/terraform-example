terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws",
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region = var.region
}

resource "aws_security_group" "web-server-security-group" {
  name = "web-server-security-group"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}


resource "aws_instance" "web-server" {
  ami = var.ami_id
  instance_type = "t2.micro"
  key_name = "aws-demo"
  vpc_security_group_ids = [
    aws_security_group.web-server-security-group.id]
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 80 &
              EOF
  tags = {
    Name = "web-server"
  }
}