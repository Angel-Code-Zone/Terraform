# terraform provider
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "0.0.0" # mention required version
        }
    }
}

proviver "aws" {
    region = "us-east-1"
    access_key = "abc123" # relpace with correct
    secret_key = "abcdefg" # replace with correct
}

# multiple aws ec2 instance

resource "aws_instance" "my_ec2" {
    for_each = tomap({
        ec2_instance_micro = "t2.micro"
        ec2_instance_medium = "t2.medium"
    }) # meta argument

    # count = 3 # meta argument --> it will create same name instance.

    ami = "abc12345" # replace with correct ami
    instance_type = each.value

    # Specify root volume volume
    root_block_device {
        volume_size = 15
        volume_type = "gp3"
    }

    tags = {
        Name = "each.key"
    }
}