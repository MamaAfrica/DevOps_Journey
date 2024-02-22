terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.36.0"
        }
    }
}

provider "aws" {
   region = "us-east-2"
}


resource "aws_instance" "terraformVM" {
  ami           = "ami-05fb0b8c1424f266b"
  instance_type = "t2.micro"
  key_name = "terraformkey"
  tags = {
    Name = "myterraformVM"
  }
}