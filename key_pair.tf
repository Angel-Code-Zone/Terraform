# terraform provider
terraform {
    required_provider {
        aws = {
            source = "hashicorp/aws"
            version = "0.0.0" # mention required version
        }
    }
}

provider "aws" {
    region = "us-east-1"
    access_key = "abc123" # relpace with correct
    secret_key = "abcdefg" # replace with correct
}

# key pair (login)
resource aws_key_pair my_key_pair {
    key_name = "ec2_key_pair"
    public_key = "123456" # else mention file like -> public_key = file("file_name.pub")
}