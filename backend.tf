terraform {
  backend "s3" {
    bucket = "testayush-1"
    key    = "siba/terraform.tfstate"
    region = "us-west-2"
  }
}
