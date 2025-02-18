provider "spacelift" {
  api_token = var.spacelift_api_token
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
}

resource "spacelift_aws_integration" "aws_account" {
  name        = "AWS Account ${var.account_id}"
  role_arn    = "arn:aws:iam::${var.account_id}:role/Spacelift"
  external_id = "spacelift-external-id"
}
