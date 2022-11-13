terraform {
  cloud {
    organization = "terraform-tutorial-sasha"

    workspaces {
      name = "terraform-tutorial-cli-flow"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9 "
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c226b3aa389adbef"
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

