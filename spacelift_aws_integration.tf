terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "1.20.0"
    }
  }
}

provider "spacelift" {
  api_token = var.spacelift_api_token
}

variable "spacelift_api_token" {
  description = "API token for Spacelift"
  type        = string
  sensitive   = true
}

data "spacelift_environment_variable" "account_id" {
  stack_id = "your-spacelift-stack-id"
  name     = "ACCOUNT_ID"
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
  default     = ""
}

resource "spacelift_aws_integration" "aws_account1" {
  name        = "AWS Account ${data.spacelift_environment_variable.account_id.value}"
  role_arn    = "arn:aws:iam::${data.spacelift_environment_variable.account_id.value}:role/Spacelift"
  external_id = "spacelift-external-id"
}

resource "spacelift_aws_integration" "aws_account" {
  name        = "AWS Account ${var.account_id}"
  role_arn    = "arn:aws:iam::${var.account_id}:role/Spacelift"
  external_id = "spacelift-external-id"
}
