
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  required_Version = ">= 1.6.0"
}

provider "aws" {
  region = "us-east-1"
}

