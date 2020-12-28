terraform {
  backend "s3" {
  }
}

provider "aws" {
  region = var.region
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn2-ami-hvm-2.0.*-x86_64-gp2",
    ]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
}

variable "region" {
  description = "The AWS region to deploy to"
  default = "eu-west-2"
}

variable "name" {
  description = "The name of the deployment"
  default = ""
}

variable "public_key" {
  default = ""
}