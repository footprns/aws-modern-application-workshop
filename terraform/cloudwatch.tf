module "cloudwatch" {
    source = "./modules/cloudwatch-loggroup"
    name = "mythicalmysfits-logs"
}