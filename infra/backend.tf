terraform {
  backend "s3" {
    bucket         = "digilians-tfstate"
    key            = "assignment/alb-asg/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
  }
}