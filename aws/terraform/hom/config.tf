provider "aws" {
  profile = "msc-hom"
  region  = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.6.0"
    }
  }

#   backend "s3" {
#     bucket = "terraform-config-bucket"
#     key    = "terraform.tfstate"
#     region = "us-east-1"
#     profile = "msc-hom"
#   }
}