provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "ram_test_terraform_bucket" {
  bucket = "ram-test-terraform-bucket"
}
