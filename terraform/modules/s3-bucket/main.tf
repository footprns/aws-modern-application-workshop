variable "bucket" {}

resource "aws_s3_bucket" "default" {
  bucket = var.bucket

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

output "id" {
  value = aws_s3_bucket.default.id
}

output "bucket" {
  value = aws_s3_bucket.default.bucket
}

output "arn" {
  value = aws_s3_bucket.default.arn
}

output "bucket_domain_name" {
  value = aws_s3_bucket.default.bucket_domain_name
}

output "policy" {
  value = aws_s3_bucket.default.policy
}
