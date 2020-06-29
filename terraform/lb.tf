module "networkloadbalancer" {
    source = "./modules/nlb"
    name = "mysfits-nlb"
    PrivateSubnet = var.PrivateSubnet
}
