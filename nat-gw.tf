# resource "aws_eip" "nat" {
#   domain = "vpc"

#   tags = {
#     Name = "EIP for NAT"
#   }
# }


resource "aws_nat_gateway" "nat" {
#  allocation_id     = aws_eip.nat.id
  connectivity_type = "private"
  subnet_id         = aws_subnet.private.id

  tags = {
    Name = "NAT"
  }
  depends_on = [aws_internet_gateway.igw]
}