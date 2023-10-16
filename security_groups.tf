resource "aws_security_group" "nginx_sg" {
  name        = "nginx-sg"
  description = "Nginx SG"
  vpc_id      = aws_vpc.nginx_vpc.id

  dynamic "ingress" {
    for_each = var.nginx_ports_tcp
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = [var.cidr_block_allow]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_block_allow]
  }
}