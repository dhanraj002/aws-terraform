resource "aws_route_table" "main" {
  count  = length(var.subnets)
  vpc_id = var.vpc_id

  tags = {
    Name             = "tf-${var.name}-${var.aws-account-env}-rt-${count.index}"
    EnvType          = var.aws-account-env
    Provisioner      = "terraform"
  }
}

resource "aws_route" "internet_gateway" {
  count                  = var.create_internet_gateway_route ? length(var.subnets) : 0
  route_table_id         = aws_route_table.main[count.index].id
  destination_cidr_block = var.ig_destination_cidr_block
  gateway_id             = var.internet_gateway_id
}

resource "aws_route_table_association" "main" {
  count          = length(var.subnets)
  subnet_id      = var.subnets[count.index]
  route_table_id = aws_route_table.main[count.index].id
}

resource "aws_route" "private_nat_gateway_route" {
  count                  = length(var.nat_gateway_ids)
  route_table_id         = aws_route_table.main[count.index].id
  destination_cidr_block = var.nat_destination_cidr_block
  nat_gateway_id         = var.nat_gateway_ids[count.index]
}

