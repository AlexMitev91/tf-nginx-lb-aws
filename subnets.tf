resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.nginx_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "Private Subnet"
  }
}

resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.nginx_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "public_1b" {
  vpc_id                  = aws_vpc.nginx_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
  }
}