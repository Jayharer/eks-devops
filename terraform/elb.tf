# AWS ELB
resource "aws_elb" "particle41-elb" {
  name            = "particle41-elb"
  subnets         = [aws_subnet.public_subet_1.id, aws_subnet.public_subet_2.id]
  security_groups = [aws_security_group.elb_sg.id]
  
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "particle41_elb"
  }
}

# security group for AWS ELB
resource "aws_security_group" "elb_sg" {
  vpc_id      = aws_vpc.particle41_vpc.id 
  name        = "elb_sg"
  description = "security group for Elastic Load Balancer"
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "elb_sg"
  }
}