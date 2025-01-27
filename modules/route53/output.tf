output "route53_zone_id" {
  description = "The ID of the Route 53 hosted zone"
  value       = aws_route53_zone.main.zone_id
}

output "sftp_record_name" {
  description = "The name of the SFTP CNAME record"
  value       = aws_route53_record.sftp.name
}