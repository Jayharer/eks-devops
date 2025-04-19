resource "aws_vpc" "particle41_vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "particle41_vpc"
  }
}

# Public Subnet 1
resource "aws_subnet" "public_subet_a" {
  vpc_id                  = aws_vpc.particle41_vpc.id 
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "public_subet_a"
  }
}

# Public Subnet 2
resource "aws_subnet" "public_subet_b" {
  vpc_id                  = aws_vpc.particle41_vpc.id 
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "public_subet_b"
  }
}

# Private Subnet 1
resource "aws_subnet" "private_subet_a" {
  vpc_id                  = aws_vpc.particle41_vpc.id 
  cidr_block              = "10.0.16.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "private_subet_a"
  }
}

# Private Subnet 2
resource "aws_subnet" "private_subet_b" {
  vpc_id                  = aws_vpc.particle41_vpc.id 
  cidr_block              = "10.0.32.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "private_subet_b"
  }
}

# internet Gateway
resource "aws_internet_gateway" "particle41_igw" {
  vpc_id = aws_vpc.particle41_vpc.id 

  tags = {
    Name = "particle41_igw"
  }
}

# Route Table
resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.particle41_vpc.id 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.particle41_igw.id
  }

  tags = {
    Name = "public_rtb"
  }
}

# route table subet association , public-az-a
resource "aws_route_table_association" "rtb_assoc_public_subnet_a" {
  subnet_id      = aws_subnet.public_subet_a.id
  route_table_id = aws_route_table.public_rtb.id
}

# route table subet association , public-az-b
resource "aws_route_table_association" "rtb_assoc_public_subnet_b" {
  subnet_id      = aws_subnet.public_subet_b.id
  route_table_id = aws_route_table.public_rtb.id
}

