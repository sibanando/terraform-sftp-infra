resource "aws_s3_bucket" "sftp_bucket" {
  bucket = var.sftp_bucket_name
}

resource "aws_iam_role" "sftp_role" {
  name = "sftp-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "transfer.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "sftp_policy" {
  role = aws_iam_role.sftp_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ]
        Effect   = "Allow"
        Resource = [
          aws_s3_bucket.sftp_bucket.arn,
          "${aws_s3_bucket.sftp_bucket.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_transfer_server" "sftp" {
  endpoint_type          = "VPC"
  identity_provider_type = "SERVICE_MANAGED"
  protocols              = ["SFTP"]
  logging_role           = aws_iam_role.sftp_role.arn

  endpoint_details {
    vpc_id             = var.vpc_id
    subnet_ids         = var.private_subnet_ids
    security_group_ids = [var.sftp_security_group]
  }
}