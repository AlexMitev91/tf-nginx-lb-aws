# Define the Application Load Balancer
resource "aws_lb" "web_lb" {
  name               = "web-lb"
  internal           = false
  security_groups    = [aws_security_group.nginx_sg.id]
  load_balancer_type = "application"
  subnets = [
    aws_subnet.public_1a.id,
    aws_subnet.public_1b.id,
  ]

  enable_deletion_protection = false

  enable_http2 = true
}

# Define a listener for the load balancer
resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_target_group.arn
  }
}

# Define a target group for the load balancer
resource "aws_lb_target_group" "web_target_group" {
  name       = "web-target-group"
  port       = "80"
  protocol   = "HTTP"
  vpc_id     = aws_vpc.nginx_vpc.id
  slow_start = 0
}

# Attach the EC2 instance to the target group
resource "aws_lb_target_group_attachment" "web_target_attachment" {
  target_group_arn = aws_lb_target_group.web_target_group.arn
  target_id        = aws_instance.ec2_instance.id
  port             = 80
}