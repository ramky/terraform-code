provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "rhel" {
  ami           = "ami-096fda3c22c1c990a"
  instance_type = "t2.micro"
  key_name      = "simplilearn_test"
  vpc_security_group_ids = [
    "sg-03ebcd62437c54ca8",
  ]
  tags = {
    Name = "terraform-centos-test"
  }
}
