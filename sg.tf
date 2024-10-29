resource "aws_security_group" "test_sg1"{
  name=var.sg
  description="ALLOW SSH HTTP HTTPS"
  ingress{
    description="SSH"
    from_port=22
    to_port=22
    protocol="tcp"
    cidr_blocks =[var.block01]
  }
  ingress{
    description="HTTP"
    from_port=80
    to_port=80
    protocol="tcp"
    cidr_blocks = [var.block02]
  }
  ingress{
    description="ICMP"
    from_port=-1
    to_port=-1
    protocol="icmp"
    cidr_blocks=[var.block03]
  }
  egress{
    from_port=0
    to_port=0
    protocol="-1"
    cidr_blocks=[var.block04]
  }
  tags={
    Name="terra_sg"
  }
}