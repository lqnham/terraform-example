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

resource "aws_key_pair" "aws-key" {
  key_name = "aws-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDIX1GaIE1MJxEZqBEoG55JD/88yMkoZdxWueBAb6tTOcf0Qo2othAj9HyB2xJc/mKRubw9E5GOg8h1oiP2BlpKRR8sqRtIpgtBCN56O0Znv5pZxabQd1uYYmWhB0A/Zxzqq/a/WvdCsNEKWNod6ntdYHd20vW2x2tYtenWp/bnTe8Cg6x/ljCJLkf5/ds2zeXhr+ZrK69SrMe7dTtViiy1+d5ckyrwyF5Ai0fKFgy1IQID9q/s3e6os8b87d9bpbJ9OkqUlVnP9XvNAlIHtQjprVad+9kE+Qyn6yJrVjOn1HAkjyFsTGRKreyFFqx5OLE5PoSS01rY86qgedXMhXitynoWfu9FKFUe98J8bE4/Os7aSZ9nxh3vI964r6AJjctjhZ3fXsLtsctbteU8mGu7IRVY4mTjhOEEVN0/pYq0evBpPIB+dWEykZoWsv0SKYTF4aP4GYb1viGUrKvs1SXT+C9Z6WXp979sBIfuXJ/JhL02TBZK6Tq/dAYbDulNBj0= example@exampleComputer"
}

resource "aws_instance" "web-server" {
  ami = var.ami_id
  instance_type = var.ec2_instance_type
  key_name = "aws-key"
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