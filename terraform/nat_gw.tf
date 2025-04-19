
# # elastic ip 
# resource "aws_eip" "ngw_eip" {
#   domain   = "vpc"
# }

# # NAT gateway
# resource "aws_nat_gateway" "public_nat_gw" {
#   allocation_id = aws_eip.ngw_eip.id
#   subnet_id     = aws_subnet.public_subet_1.id

#   tags = {
#     Name = "public_nat_gw"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.particle41_igw]
# }

# resource "aws_route_table" "private_rtb" {
#   vpc_id = aws_vpc.particle41_vpc.id 
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.public_nat_gw.id 
#   }

#   tags = {
#     Name = "private_rtb"
#   }
# }

# # route table subet association , private-1a
# resource "aws_route_table_association" "private_subnet_1a" {
#   subnet_id      = aws_subnet.private_subet_1.id
#   route_table_id = aws_route_table.private_rtb.id
# }

# # route table subet association , private-2b
# resource "aws_route_table_association" "private_subnet_2b" {
#   subnet_id      = aws_subnet.private_subet_2.id
#   route_table_id = aws_route_table.private_rtb.id
# }