output "vpc_id" {
  value = aws_vpc.main.id
}

output "default_security_group_id" {
  value = aws_vpc.main.default_security_group_id
}

output "cidr" {
  value = var.cidr
}

output "subnets" {
  value = aws_subnet.subnets.*.id
}

output "private_app_subnets" {
  value = aws_subnet.private_app_subnets.*.id
}

output "private_app_subnets_azs" {
  value = aws_subnet.private_app_subnets.*.availability_zone
}

output "private_app_subnets_count" {
  value = length(aws_subnet.private_app_subnets.*.id)
}

output "subnets_count" {
  value = length(aws_subnet.subnets.*.id)
}

output "azs" {
  value = aws_subnet.subnets.*.availability_zone
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main.id
}

output "nat_gateway_ids" {
  value = aws_nat_gateway.main.*.id
}

output "nat_gateway_public_ips" {
  value = aws_nat_gateway.main.*.public_ip
}

output "nat_gateway_public_ip_cidrs" {
  value = formatlist("%s/32", aws_nat_gateway.main.*.public_ip)
}

output "available_azs" {
  value = data.aws_availability_zones.available.names
}

output "private_app_subnets_name" {
  value = element(
    concat(aws_docdb_subnet_group.private_docdb_subnets.*.name, [""]),
    0,
  )
}