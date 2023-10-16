output "Nginx-URL" {
  value = "http://${aws_lb.web_lb.dns_name}/"
}
output "AMI-ID" {
  value = aws_instance.ec2_instance.ami
}

output "public_ip" {
  value = aws_instance.ec2_instance.public_ip
}