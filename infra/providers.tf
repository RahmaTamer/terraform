provider "aws" {
 region = var.REGION
}
terraform {
 backend "s3" {
 bucket = "digilians-tfstate"
 key = "terraform.tfstate"
 region = var.REGION
 }
}
