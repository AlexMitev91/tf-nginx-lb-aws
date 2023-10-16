data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


variable "cidr_block_allow" {
  default = "0.0.0.0/0"
}

variable "nginx_ports_tcp" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22, 80]
}