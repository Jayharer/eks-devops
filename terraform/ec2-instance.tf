
# ec2 instance 
resource "aws_instance" "my_ec2" {
  ami           = "ami-0f40c8f97004632f9"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_subet_1.id  
  vpc_security_group_ids = [aws_security_group.allow_http_sg.id]

  tags = {
    Name = "my_ec2"
  }

}