variable "name" {}
variable "PrivateSubnet" {}
resource "aws_lb" "test" {
  name               = var.name
  internal           = false
  load_balancer_type = "network"
  subnets            = var.PrivateSubnet

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}