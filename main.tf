terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.57.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA4HZDM6UDY6VSOPF4"
  secret_key = "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"
}

resource "aws_vpc" "rohith-vpc" {
  cidr_block       = "192.68.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "rohith-vpc"
  }
}
resource "aws_subnet" "rohith-subnet" {
  vpc_id     = aws_vpc.rohith-vpc.id
  cidr_block = "192.68.0.0/24"

  tags = {
    Name = "rohith-subnet"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.rohith-vpc.id

  tags = {
    Name = "rohit-internet-gateway"
  }
}
resource "aws_instance" "server-1" {
  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-server-1"
  }
}