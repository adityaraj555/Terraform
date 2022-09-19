provider "aws" {
    region = "ap-south-1"
    access_key = "AKIA34SUGCRYLOHMQAWY"
    secret_key = "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"
  
}
variable "subnet-dev" {
    description = "assign value to subnet cider"
    
    type = list(string)

  
}
variable "environment" {
    description = "assign value to subnet cider"
    type = string

  
}


resource "aws_vpc" "development-vpc" {
    cidr_block = var.subnet-dev[0]

    tags = {
        Name = var.environment
    
  }  
}
resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = var.subnet-dev[1]
    availability_zone = "ap-south-1a"

    tags = {
      "Name" = var.environment
    }
  
}
