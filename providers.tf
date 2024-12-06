terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.2.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.30.0"
    }
  }
}

provider "keycloak" {
  client_id     = "terraform"
  client_secret = "xxxxxx"
  url           = "https://keycloack.super.tech"
}

provider "aws" {
  # The AWS region in which all resources will be created
  region  = "eu-central-1"
  profile = "terraform"
}


resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-keycloak"
}