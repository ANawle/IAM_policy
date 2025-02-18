provider "spacelift" {
  api_token = var.spacelift_api_token
}

variable "account_id" {
  default = lookup(var.env, "ACCOUNT_ID", "")
}

resource "spacelift_aws_integration" "aws_account" {
  name        = "AWS Account ${var.account_id}"
  role_arn    = "arn:aws:iam::${var.account_id}:role/Spacelift"
  external_id = "spacelift-external-id"
}
