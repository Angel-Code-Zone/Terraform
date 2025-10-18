# terraform provider
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "0.0.0" # mention required version
        }
    }
}

provider "aws" {
    region = "us-east-1"
    access_key = "123456"
    secret_key = "123456"
}

# create a vpc (virtual privet network)
resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "my_vpc_networl"
    }
}

# create a public subnet
resource "aws_subnet" "my_public_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.1.0/24"
}

# create a private subnet
resource "aws_subnet" "my_private_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.2.0/24"
}

# create a internet gateway
resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id
}

# create routes for public subnet
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.my_pvc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }
}

# create route tabe association public subnet
resource "aws_route_table_association" "public_route_table_association" {
    subnet_id = aws_subnet.my_public_subnet.id
    route_table_id = aws_route_table.public_route_table.id
}