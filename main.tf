terraform {
  required_version = ">= 1.0"
  backend "s3" {           # Estado remoto en AWS S3
    bucket = "mi-terraform-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

# Crear una VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MiVPC"
  }
}

# Crear una instancia EC2
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # AMI de Amazon Linux
  instance_type = "t2.micro"

  tags = {
    Name = "MiServidor"
  }
}
