output "sftp_security_group_id" {
  description = "The ID of the SFTP security group"
  value       = aws_security_group.sftp_sg.id
}