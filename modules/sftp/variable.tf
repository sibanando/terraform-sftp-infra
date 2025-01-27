variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "sftp_bucket_name" {
  type = string
}

variable "sftp_security_group" {
  type = string
}