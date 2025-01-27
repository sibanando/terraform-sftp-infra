output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.internal.dns_name
}

output "alb_zone_id" {
  description = "The zone ID of the Application Load Balancer"
  value       = aws_lb.internal.zone_id
}

output "target_group_arn" {
  description = "The ARN of the target group for SFTP"
  value       = aws_lb_target_group.sftp_tg.arn
}