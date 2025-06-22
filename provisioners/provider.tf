terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
  }
  backend "s3" {
    bucket = "ramana-remote-state"
    key    = "remote-state"
    region = "us-east-1"
    # dynamodb_table = "remote-state-file" # to create and mange .tfstate file in dynomodb table

    encrypt = true  #to create .tfstate file in s3 bucket itself
    use_lockfile = true
  }
}

# Configure the AWS Provider
provider "aws" {
  
  region = "us-east-1"
  
}


  


