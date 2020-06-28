module "static-content" {
  source = "./modules/s3-bucket"
  bucket = var.bucket
}