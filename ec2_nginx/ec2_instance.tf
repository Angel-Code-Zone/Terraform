# Terraform provider
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "0.0.0" # mention required version
        }
    }
}

roviver "aws" {
    region = "us-east-1"
    access_key = "abc123" # relpace with correct
    secret_key = "abcdefg" # replace with correct
}

# aws ec2 instance
resource "aws_instance" "my_ec2" {
    ami = "abc12345" # replace with correct ami.
    instance_type = "t2.micro"
    user_data = file("install_nginx.sh")

    # Specify root volume volume
    root_block_device {
        volume_size = 15
        volume_type = "gp3"
    }

    tags = {
        Name = "ec2_machine"
    }
}