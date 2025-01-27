region              = "us-west-2"
vpc_cidr_block      = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.4.0/24"]
private_subnet_cidrs = ["10.0.2.0/24", "10.0.3.0/24"]
availability_zones  = ["us-west-2a", "us-west-2b"]
sftp_bucket_name    = "my-unique-sftp-bucket"
domain_name         = "askxavierson.com"