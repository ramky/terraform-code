provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "zoo1" {
  ami           = "ami-0e472ba40eb589f49"
  instance_type = "t2.small"
  vpc_security_group_ids = [
    "sg-0348c08568c802d73",
  ]
  tags = {
    Name = "zoo1"
  }
}

output "ec2_global_ips" {
  value = [aws_instance.zoo1.*.public_ip]
}
