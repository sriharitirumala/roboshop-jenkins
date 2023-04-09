terraform {
  backend "s3" {
    bucket = "sriharibucket"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}