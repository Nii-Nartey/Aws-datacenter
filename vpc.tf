#VPC CONFIGURE
resource "aws_vpc" "range" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "range"
  }
}

#Public subnet one configure
resource "aws_subnet" "pub1" {
  vpc_id     = aws_vpc.range.id
  cidr_block = var.Subnet-cidr
  availability_zone = "eu-west-2c"

  tags = {
    Name = "pub1"
  }
}


#Public subnet two configure
resource "aws_subnet" "pub2" {
  vpc_id     = aws_vpc.range.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-2b"
  tags = {
    Name = "pub2"
  }
}


#Public subnet three configure
resource "aws_subnet" "pub3" {
  vpc_id     = aws_vpc.range.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "pub3"
  }
}


#Private subnet one configure
resource "aws_subnet" "pri1" {
  vpc_id     = aws_vpc.range.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "pri1"
  }
}


#Private subnet two configure
resource "aws_subnet" "pri2" {
  vpc_id     = aws_vpc.range.id
  cidr_block = "10.0.15.0/24"
  availability_zone = "eu-west-2b"
  tags = {
    Name = "pri2"
  }
}


#Private subnet three configure
resource "aws_subnet" "pri3" {
  vpc_id     = aws_vpc.range.id
  cidr_block = "10.0.18.0/24"
  availability_zone = "eu-west-2c"

  tags = {
    Name = "pri3"
  }
}


#Public route table
resource "aws_route_table" "bench-one" {
  vpc_id = aws_vpc.range.id

  tags = {
    Name = "bench-one"
  }
}


#Private route table
resource "aws_route_table" "bench-two" {
  vpc_id = aws_vpc.range.id
  
  tags = {
    Name = "bench-two"
  }
}


#Public route table associaton 1
resource "aws_route_table_association" "a1" {
  subnet_id      = aws_subnet.pub1.id
  route_table_id = aws_route_table.bench-one.id
}


#Public route table associaton 2
resource "aws_route_table_association" "a2" {
  subnet_id      = aws_subnet.pub2.id
  route_table_id = aws_route_table.bench-one.id
}


#Public route table associaton 3
resource "aws_route_table_association" "a3" {
  subnet_id      = aws_subnet.pub3.id
  route_table_id = aws_route_table.bench-one.id
}


#Private route table associaton 1
resource "aws_route_table_association" "pa1" {
  subnet_id      = aws_subnet.pri1.id
  route_table_id = aws_route_table.bench-two.id
}


#Private route table associaton 2
resource "aws_route_table_association" "pa2" {
  subnet_id      = aws_subnet.pri2.id
  route_table_id = aws_route_table.bench-two.id
}


#Private route table associaton 3
resource "aws_route_table_association" "pa3" {
  subnet_id      = aws_subnet.pri3.id
  route_table_id = aws_route_table.bench-two.id
}


#Internet gateway config
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.range.id

  tags = {
    Name = "igw"
  }
}



#Route configuration
resource "aws_route" "link" {
  route_table_id            = aws_route_table.bench-one.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}