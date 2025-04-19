# # security group for app
# resource "aws_security_group" "allow_http_sg" {
#   vpc_id      = aws_vpc.particle41_vpc.id 
#   description = "security group that allows http connection"

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
  
#   tags = {
#     Name = "allow_http_sg"
#   }
# }

