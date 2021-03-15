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

resource "aws_instance" "web" {
  ami           = "ami-0767046d1677be5a0"
  instance_type = "t2.micro"

}