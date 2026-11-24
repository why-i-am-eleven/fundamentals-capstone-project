variable "vpc_cidr" {
  type        = string
  description = "VPC IPv4 CIDR; confirm it does not overlap with connected networks."
  default     = "10.20.0.0/16"
}

locals {
  subnets = {
    public_a = { cidr = "10.20.1.0/24",  az_index = 0, tier = "public" }
    public_b = { cidr = "10.20.2.0/24",  az_index = 1, tier = "public" }
    app_a    = { cidr = "10.20.11.0/24", az_index = 0, tier = "app" }
    app_b    = { cidr = "10.20.12.0/24", az_index = 1, tier = "app" }
    db_a     = { cidr = "10.20.21.0/24", az_index = 0, tier = "db" }
    db_b     = { cidr = "10.20.22.0/24", az_index = 1, tier = "db" }
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.project_name}-vpc"
    Project     = var.project_name
    Environment = "nonprod"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = { Name = "${var.project_name}-igw" }
}

resource "aws_subnet" "tier" {
  for_each = local.subnets
  vpc_id   = aws_vpc.main.id
  cidr_block = each.value.cidr
  availability_zone = data.aws_availability_zones.available.names[each.value.az_index]
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.project_name}-${each.key}"
    Tier = each.value.tier
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = { Name = "${var.project_name}-public-rt" }
}

resource "aws_route_table_association" "public" {
  for_each       = toset(["public_a", "public_b"])
  subnet_id      = aws_subnet.tier[each.key].id
  route_table_id = aws_route_table.public.id
}

# App and DB subnets deliberately have no default internet route in this starter.
# Add NAT gateways or VPC endpoints only after egress requirements and costs are reviewed.
resource "aws_route_table" "private" {
  for_each = toset(["app_a", "app_b", "db_a", "db_b"])
  vpc_id   = aws_vpc.main.id
  tags     = { Name = "${var.project_name}-${each.key}-rt" }
}

resource "aws_route_table_association" "private" {
  for_each       = toset(["app_a", "app_b", "db_a", "db_b"])
  subnet_id      = aws_subnet.tier[each.key].id
  route_table_id = aws_route_table.private[each.key].id
}
