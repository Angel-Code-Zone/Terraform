# Terraform provider
terraform {
    required_providers {
        asw = {
            source = "hashicorp/aws"
            version = "0.0.0" # mention required version
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

# Key pair (Login)
resource aws_key_pair my_key {
    key_name = "ec2-key-pair"
    public_key = file("ec2-key-pair.pub") # Replace the correct key pair file name.
}

# VPC and Security Group
resource aws_default_vpc default{

}

resource aws_security_group my_security_group {
    name = "ec2_sg"
    description = "this will add TF generated security group"
    vpc_id = aws_default_vpc.default.id # interpolation

    # inbound rules (ingress)
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH port open"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        Cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP port open"
    }

    # outbound rules (egress)
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        Cidr_blocks = ["0.0.0.0/0"]
        description = "all access open outbound"
    } 

    # tags
    tags = {
        Name = "ec2_security_group"
    }
}

# aws ec2 instance
resource "aws_instance" "linux" {
    key_name = aws_key_pair.my_key
    security_groups = [aws_security_group.my_security_group.name]
    instance_type = "t2.micro"
    ami = "abcdefg" # Replace the correct ami id.
    # user_data = file("abc.sh")

    # adding root block device
    root_block_device {
        volume_size = 15
        volume_type = "gp3"
    }

    # tags
    tags = {
        Name = "Terraform_ec2"
    }
}