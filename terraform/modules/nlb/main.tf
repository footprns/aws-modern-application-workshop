variable "name" {}
variable "PrivateSubnet" {
  type = list
}
variable "vpc_id" {}
variable "target_group_name" {}

resource "aws_lb" "default" {
  name               = var.name
  internal           = false
  load_balancer_type = "network"
  subnets            = var.PrivateSubnet
  enable_deletion_protection = false
  tags = {
    Environment = "production"
  }
}
# aws elbv2 create-listener --default-actions TargetGroupArn=REPLACE_WITH_TARGET_GROUP_ARN,Type=forward --load-balancer-arn REPLACE_WITH_LOAD_BALANCER_ARN --port 80 --protocol TCP
resource "aws_lb_listener" "default" {
  load_balancer_arn = aws_lb.default.arn
  port              = "80"
  protocol          = "TCP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.default.arn
  }
}


resource "aws_lb_target_group" "default" {
  name        = var.target_group_name
  port        = 8080
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = var.vpc_id
  health_check {
    interval = "10"
    path = "/"
    protocol = "HTTP"
    healthy_threshold = "3"
    unhealthy_threshold = "3"
  }
}

