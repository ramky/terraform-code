provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "zoo1" {
  ami           = "ami-0e472ba40eb589f49"
  instance_type = "t2.medium"
  vpc_security_group_ids = [
    var.security_group,
  ]
  tags = {
    Name = "zoo1"
  }
}

# resource "aws_instance" "zoo2" {
#   ami           = "ami-0e472ba40eb589f49"
#   instance_type = "t2.small"
#   vpc_security_group_ids = [
#     var.security_group,
#   ]
#   tags = {
#     Name = "zoo2"
#   }
# }

# resource "aws_instance" "zoo3" {
#   ami           = "ami-0e472ba40eb589f49"
#   instance_type = "t2.small"
#   vpc_security_group_ids = [
#     sg-0be9fdd7e313fcfc8,
#   ]
#   tags = {
#     Name = "zoo3"
#   }
# }

output "ec2_global_ips" {
  # value = [aws_instance.zoo1.*.public_ip, aws_instance.zoo2.*.public_ip, aws_instance.zoo3.*.public_ip]
  value = [aws_instance.zoo1.*.public_ip]

}
