terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.32.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  shared_credentials_file = ".aws/credentials"
}

resource "aws_security_group" "allow_ssh" {
  name = "allow-ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Docker"
    from_port   = 4243
    to_port     = 4243
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

resource "aws_instance" "maven" {
  ami           = "ami-0767046d1677be5a0"
  instance_type = "t2.micro"
  key_name = "${var.aws_key_name}"
  security_groups = ["${aws_security_group.allow_ssh.name}"]

  tags = {
    "Name" = "Maven"
  }
}


resource "aws_instance" "tomcat" {
  ami           = "ami-0767046d1677be5a0"
  instance_type = "t2.micro"
  key_name = "${var.aws_key_name}"
  security_groups = ["${aws_security_group.allow_ssh.name}"]

  tags = {
    "Name" = "Tomcat"
  }
}
