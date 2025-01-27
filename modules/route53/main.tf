resource "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_route53_record" "sftp" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "sftp"
  type    = "CNAME"
  ttl     = 300
  records = [var.alb_dns_name]
}