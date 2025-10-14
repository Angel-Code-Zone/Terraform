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
    access_key = "abc" # relpace with correct
    secret_key = "abcdefg" # replace with correct
}

# aws ec2 instance
resource "aws_instance" "my_ec2" {
    ami = "abc12345" # replace with correct ami.
    instance_type = "t2.micro"

    tags = {
        Name = "ec2_machine"
    }

    # key_name = aws_key_pair.my_key --- (key_pair)
    # security_groups = [aws_security_group.my_security_group.name] --- (security_group)
    # user_data = file("abc.sh") --- (if any script file is there)

    #root block device
    /*
    root_block_device {
        volume_size = 10 # mention value is in GB
        volume_type = "gp3"
    }
    */
}