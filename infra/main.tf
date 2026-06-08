resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
 instance_tenancy = "default"

 tags = {
 "owner" = "vinod"
 Name = var.vpc_name
 }
}


resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.subnet.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}





resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.gw.id

  tags = {
    Name = "main"
  }
}





resource "aws_route_table" "r" {
  vpc_id = aws_vpc.r.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.main.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.foo.id
  }

  tags = {
    Name = "main"
  }
}





resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.association.id
  route_table_id = aws_route_table.association.id
}