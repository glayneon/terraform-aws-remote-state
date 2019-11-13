# Terraform - AWS
# https://www.terraform.io/docs/providers/aws/index.html
# https://www.terraform.io/docs/configuration/interpolation.html
# https://www.terraform.io/docs/configuration/resources.html

terraform {
  required_version = ">= 0.11.0"
}

provider "aws" {
  region = "${var.aws_region}"
}


terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "aiops-chase-remote-state"
    dynamodb_table = "aiops-chase-remote-state"
    key            = "aiops-chase-"
    region         = "ap-northeast-2"

  }
  required_providers {
    aws = ">= 2.32.0"
  }
}

