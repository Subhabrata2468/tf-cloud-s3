terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.75.1"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "random_id" "main" {
  byte_length = 12
}

resource "aws_s3_bucket" "demo-bucket" {
  bucket = "tf-cloud-s3-${random_id.main.hex}"
}