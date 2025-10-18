# terraform provider
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "0.0.0" # mention required version.
        }
    }
}

proviver "aws" {
    region = "us-east-1"
    access_key = "abc123" # relpace with correct
    secret_key = "abcdefg" # replace with correct
}

resource aws_security_group my_sg {
    name = "ec2_sg"
    description = "this is ec2 security group"

    # inbound rules (ingress)
    ingress {
        from_port = 22
        to_port = 2
        protocol = "tcp"
        cidr_blocks = [""0.0.0.0/0]
        description = "SSH port open"
    }

    # outbound rules (egress)
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [""0.0.0.0/0]
        description = "all access open outbound"
    }

    tags = {
        Name = "my_security_group"
    }
}