terraform {
  backend "s3" {
    bucket = "testayush01"
    key    = "siba/terraform.tfstate"
    region = "us-west-2"
  }
}
