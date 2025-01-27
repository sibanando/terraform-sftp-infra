output "sftp_server_endpoint" {
  description = "The endpoint of the SFTP server"
  value       = aws_transfer_server.sftp.endpoint
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket for SFTP"
  value       = aws_s3_bucket.sftp_bucket.bucket
}

output "sftp_role_arn" {
  description = "The ARN of the IAM role for SFTP"
  value       = aws_iam_role.sftp_role.arn
}