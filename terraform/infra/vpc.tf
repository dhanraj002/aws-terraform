module "vpc" {
  source               = "../modules/vpc"
  name                 = var.name
  cidr                 = var.vpc_cidr
  private_app_subnets  = var.vpc_private_app_subnets
  subnets              = var.vpc_subnets
  azs                  = var.vpc_azs
  aws-account-env      = var.aws_account_env
  sg_egress_cidr_block = var.sg_egress_cidr_block
  eks_name             = var.eks_name
}

module "vpc_route_tables" {
  source                        = "../modules/vpc_route_tables"
  name                          = "${var.name}-public_subnet"
  vpc_id                        = module.vpc.vpc_id
  subnets                       = module.vpc.subnets
  internet_gateway_id           = module.vpc.internet_gateway_id
  create_internet_gateway_route = true
  aws-account-env               = var.aws_account_env
  ig_destination_cidr_block     = var.ig_destination_cidr_block
}

module "vpc_route_tables_private_app_subnets" {
  source                     = "../modules/vpc_route_tables"
  name                       = "${var.name}-private_app_subnets"
  vpc_id                     = module.vpc.vpc_id
  subnets                    = module.vpc.private_app_subnets
  nat_gateway_ids            = module.vpc.nat_gateway_ids
  aws-account-env            = var.aws_account_env
  nat_destination_cidr_block = var.nat_destination_cidr_block
}

