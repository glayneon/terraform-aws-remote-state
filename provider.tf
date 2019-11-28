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
  encrypt = true
  bucket = "aiops-remote-state-chase"
  dynamodb_table = "aiops-remote-state-chase"
  key = "test/remote-state/remote-state-state"
  region = "ap-northeast-2"

  }
  required_providers {
    aws = ">= 2.32.0"
  }
}
