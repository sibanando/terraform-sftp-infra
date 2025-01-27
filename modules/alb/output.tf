# Duplicate outputs removed to avoid conflicts

output "target_group_arn" {
  description = "The ARN of the target group for SFTP"
  value       = aws_lb_target_group.sftp_tg.arn
}