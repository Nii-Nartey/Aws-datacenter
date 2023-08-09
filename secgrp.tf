#SECURITY GROUPS CONFIG
resource "aws_security_group" "pass" {
  name        = "Http"
  description = "Allow http inbound traffic"
  vpc_id      = aws_vpc.range.id

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.range.cidr_block]

  }
    ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.range.cidr_block]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "pass"
  }
}