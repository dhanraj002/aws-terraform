resource "aws_vpc" "main" {
  cidr_block           = var.cidr
  enable_dns_hostnames = var.enable_hostnames
  enable_dns_support   = var.enable_dns

  tags = {
    Name             = "tf-${var.name}-${var.aws-account-env}-vpc"
    EnvType          = var.aws-account-env 
    Provisioner      = "terraform"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name             = "tf-${var.name}-${var.aws-account-env}-igw"
    EnvType          = var.aws-account-env
    ProductComponent = "${var.name}-gw"
    Provisioner      = "terraform"
  }
}

resource "aws_eip" "main" {
  count = length(var.subnets)
  vpc   = true
  tags = {
    Name             = "tf-${var.name}-${var.aws-account-env}-${count.index}-eip"
    EnvType          = var.aws-account-env 
    Provisioner      = "terraform"
  }
}

resource "aws_nat_gateway" "main" {
  count         = length(var.subnets)
  allocation_id = aws_eip.main[count.index].id
  subnet_id     = element(aws_subnet.subnets.*.id, count.index)
  depends_on    = [aws_internet_gateway.main]

  tags = {
    Name             = "tf-${var.name}-${var.aws-account-env}-${count.index}-nat-gw"
    EnvType          = var.aws-account-env
    Provisioner      = "terraform"
  }
}

resource "aws_subnet" "subnets" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnets[count.index]
  availability_zone = element(var.azs, count.index)
  count             = length(var.subnets)

  tags = {
    Name = format(
      "tf-%s-${var.aws-account-env}-subnet-public-%s",
      var.name,
      element(var.azs, count.index),
    )
    EnvType                                                                       = var.aws-account-env
    Provisioner                                                                   = "terraform"
    "kubernetes.io/role/elb"                                                      = 1
    "kubernetes.io/cluster/tf-${var.eks_name}-${var.aws-account-env}-eks-cluster" = "shared"
  }

  map_public_ip_on_launch = var.map_public_ip_on_launch
}

resource "aws_subnet" "private_app_subnets" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_app_subnets[count.index]
  availability_zone = element(var.azs, count.index)
  count             = length(var.private_app_subnets)

  tags = {
    Name = format(
      "tf-%s-${var.aws-account-env}-subnet-private-app-%s",
      var.name,
      element(var.azs, count.index),
    )
    EnvType                                                                       = var.aws-account-env
    Provisioner                                                                   = "terraform"
    "kubernetes.io/role/internal-elb"                                             = 1
    "kubernetes.io/cluster/tf-${var.eks_name}-${var.aws-account-env}-eks-cluster" = "shared"

  }
}

resource "aws_docdb_subnet_group" "private_docdb_subnets" {
  name        = "tf-${var.name}-${var.aws-account-env}-docdb-subnet-group"
  description = "Database subnet groups for ${var.name}"
  subnet_ids  = aws_subnet.private_app_subnets.*.id
  count       = length(var.private_app_subnets) > 0 ? 1 : 0

  tags = {
    Name             = "tf-${var.name}-${var.aws-account-env}-docdb-subnet-group"
    EnvType          = var.aws-account-env
    Provisioner      = "terraform"
  }
}


resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.main.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.sg_egress_cidr_block
  }

  tags = {
    Name             = "tf-${var.name}-${var.aws-account-env}-default-sg"
    EnvType          = var.aws-account-env
    Provisioner      = "terraform"
  }
}