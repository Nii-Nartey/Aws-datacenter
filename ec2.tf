#SERVER CONFIG
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance
  key_name = "webkey"
  vpc_security_group_ids = [aws_security_group.pass.id]
  associate_public_ip_address = true 
  subnet_id = aws_subnet.pub1.id


  tags = {
    Name = "web"
  }
}


#SERVER 2 CONFIG 
resource "aws_instance" "weba" {
  ami           = var.ami
  instance_type = var.instance
  key_name = "webkey"
  vpc_security_group_ids = [aws_security_group.pass.id]
  associate_public_ip_address = true 
  subnet_id = aws_subnet.pub3.id


  tags = {
    Name = "weba"
  }
}