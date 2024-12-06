terraform {
  backend "s3" {
    bucket = "terraform-state-keycloak"
    encrypt = true
    key     = "terraform.tfstate"
    profile = "terraform"
    region  = "eu-central-1"
  }
}
