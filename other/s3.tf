variable "aws_access_key" {}
variable "aws_secret_key" {}

provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_s3_bucket" "s3_test" {
  bucket = "ram-test-bucket-9877"
  acl    = "private"
  tags = {
    name = "ram-test-bucket-9877"
  }
  versioning {
    enabled = true
  }
}
