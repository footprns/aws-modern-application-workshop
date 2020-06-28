module "static-content" {
  source = "./modules/s3-bucket"
  bucket = var.S3_BUCKET_NAME
}