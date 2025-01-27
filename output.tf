output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "sftp_security_group_id" {
  description = "The ID of the SFTP security group"
  value       = module.security.sftp_security_group_id
}

output "sftp_server_endpoint" {
  description = "The endpoint of the SFTP server"
  value       = module.sftp.sftp_server_endpoint
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket for SFTP"
  value       = module.sftp.s3_bucket_name
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "alb_zone_id" {
  description = "The zone ID of the Application Load Balancer"
  value       = module.alb.alb_zone_id
}

output "route53_zone_id" {
  description = "The ID of the Route 53 hosted zone"
  value       = module.route53.route53_zone_id
}

output "sftp_record_name" {
  description = "The name of the SFTP CNAME record"
  value       = module.route53.sftp_record_name
}