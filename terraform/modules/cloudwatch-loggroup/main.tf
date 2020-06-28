variable "name" {}

resource "aws_cloudwatch_log_group" "default" {
  name = var.name

#   tags = {
#     Environment = "production"
#     Application = "serviceA"
#   }
}