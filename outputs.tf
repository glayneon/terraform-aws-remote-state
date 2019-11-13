# Outputs
# https://www.terraform.io/docs/configuration/outputs.html

locals {
  config_backend_s3 = <<CONFIGBACKENDS3


terraform {
  backend "s3" {
  encrypt = true
  bucket = "${aws_s3_bucket.remote_state_bucket.id}"
  dynamodb_table = "${aws_dynamodb_table.state_locking_table.id}"
  key = "${local.prefix_name}-state"
  region = "${var.aws_region}"

  }
  required_providers {
    aws = ">= 2.32.0"
  }
}
CONFIGBACKENDS3
}

output "region" {
  value = "${var.aws_region}"
}

output "environment" {
  value = "${var.aws_environment}"
}

output "remote_state_bucket_name" {
  value = "${aws_s3_bucket.remote_state_bucket.id}"
}

output "remote_state_bucket_arn" {
  value = "${aws_s3_bucket.remote_state_bucket.arn}"
}

output "logs_bucket_name" {
  value = "${aws_s3_bucket.logs_bucket.id}"
}

output "logs_bucket_arn" {
  value = "${aws_s3_bucket.logs_bucket.arn}"
}

output "kms_encryption_key_arn" {
  value = "${aws_kms_key.encryption_key.arn}"
}

output "dynamodb_table_name" {
  value = "${aws_dynamodb_table.state_locking_table.id}"
}

output "dynamodb_table_arn" {
  value = "${aws_dynamodb_table.state_locking_table.arn}"
}

output "iam_group_terraform_rw_access_name" {
  value = "${aws_iam_group.terraform_rw_access.name}"
}

output "iam_group_terraform_rw_access_arn" {
  value = "${aws_iam_group.terraform_rw_access.arn}"
}

output "iam_group_terraform_ro_access_name" {
  value = "${aws_iam_group.terraform_ro_access.name}"
}

output "iam_group_terraform_ro_access_arn" {
  value = "${aws_iam_group.terraform_ro_access.arn}"
}

output "config_backend_s3" {
  value = "${local.config_backend_s3}"
}
