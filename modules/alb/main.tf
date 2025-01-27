resource "aws_lb" "internal" {
  name               = "sftp-alb"
  internal           = false
  load_balancer_type = "network"
  subnets            = var.public_subnet_ids
  security_groups    = [var.sftp_security_group]
}

resource "aws_lb_target_group" "sftp_tg" {
  name     = "sftp-tg"
  port     = 22
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "sftp_listener" {
  load_balancer_arn = aws_lb.internal.arn
  port              = 22
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sftp_tg.arn
  }
}

output "alb_dns_name" {
  value = aws_lb.internal.dns_name
}

output "alb_zone_id" {
  value = aws_lb.internal.zone_id
}