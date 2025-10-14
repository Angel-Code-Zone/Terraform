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

# vpc (virtual privet network)
