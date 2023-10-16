resource "aws_instance" "ec2_instance" {
  ami                    = "ami-02c8e84c074bee888"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
  key_name               = "am-onboarding"

  tags = {
    Name = "Challenge-EC2"
  }
}