provider "aws" {
  region = "us-east-1"
}

resource "aws_ssm_parameter" "build_version" {
  name  = "/myapp/release/latest_version"
  type  = "String"
  value = "1.0.0"
}