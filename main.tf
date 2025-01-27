provider "aws" {
  region = var.region
}

resource "random_id" "bucket_id" {
  byte_length = 8
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block       = var.vpc_cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "security" {
  source = "./modules/security"

  vpc_id = module.vpc.vpc_id
}

module "sftp" {
  source = "./modules/sftp"

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  sftp_bucket_name   = "${var.sftp_bucket_name}-${random_id.bucket_id.hex}"
  sftp_security_group = module.security.sftp_security_group_id
}

module "alb" {
  source = "./modules/alb"

  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  sftp_security_group = module.security.sftp_security_group_id
}

module "route53" {
  source = "./modules/route53"

  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id
  domain_name  = var.domain_name
}