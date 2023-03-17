variable "aws_key_pair" {
  default = "~/.ssh/udemy_test.pem"
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "rhel9_latest" {
  most_recent = true

  owners = ["309956199498"] // Red Hat's account ID.

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["RHEL-9*"]
  }
}

resource "aws_security_group" "http_server_sg" {
  name   = "http_server_sg"
  vpc_id = "vpc-6b29a012"
  tags = {
    name = "http_server_sg"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_instance" "http_server" {
  # ami = "ami-0c9978668f8d55984"
  ami                    = data.aws_ami.rhel9_latest.id
  key_name               = "udemy_test"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  subnet_id              = "subnet-e33fbdcf"

  # connection {
  #   type = "ssh"
  #   host = self.public_ip
  #   user = "ec2-user"
  #   private_key = file(var.aws_key_pair)
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo yum install httpd -y", // install httpd
  #     "sudo httpd start", // start service
  #     "echo Welcome to Virtual Server ${self.public_dns} | sudo tee /var/www/html/index.html" // create default file
  #   ]
  # }
}
