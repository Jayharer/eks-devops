terraform {
  backend "s3" {
    bucket = "jayambar-terraform-backend"
    key = "particle41/terraform.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}