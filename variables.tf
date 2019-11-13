# Variables
# Author: Chase, Kim in PCT Team
# https://www.terraform.io/intro/getting-started/variables.html
# https://www.terraform.io/docs/configuration/variables.html

variable "aws_region" {
  description = "the AWS region"
  default     = "ap-northeast-2"
}

variable "name_project" {
  description = "the name for this project"
  default     = "remote-state"
}

variable "aws_environment" {
  description = "the AWS environment"
  default     = "test"
}

variable "name_prefix" {
  description = "the name prefix for AIOps"
  default     = "aiops"
}

variable "name_owner" {
  description = "The name for owner or team."
  default     = "chase"
}

variable "dynamodb_read_capacity_units" {
  description = "the amount of read capacity units for the DynamoDB table"
  default     = 10
}

variable "dynamodb_write_capacity_units" {
  description = "the amount of write capacity units for the DynamoDB table"
  default     = 3
}

# It's local values

locals {
  full_name                = "${var.name_prefix}-${var.name_owner}-${var.name_project}"
  prefix_name = "${var.name_prefix}-${var.name_owner}"
  s3_bucket_name           = "${local.full_name}"
  dynamodb_table_name      = "${local.full_name}"
  iam_group_name_rw_access = "${local.full_name}_rw_access"
  iam_group_name_ro_access = "${local.full_name}_ro_access"
}
