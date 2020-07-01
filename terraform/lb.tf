module "networkloadbalancer" {
    source = "./modules/nlb"
    name = "mysfits-nlb"
    target_group_name = "MythicalMysfits-TargetGroup"
    PrivateSubnet = tolist(split(",", var.PublicSubnet))
    vpc_id = var.vpc_id
}

module "service-name" {
  source = "./modules/service_linked_role"
  aws_service_name = "ecs.amazonaws.com"
}
