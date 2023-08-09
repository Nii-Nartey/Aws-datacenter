#Create a MySQl
resource "aws_db_instance" "mydemodb" {
  identifier = "mysqldatabase"
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t2.micro"
  port = 3306
  db_subnet_group_name = aws_db_subnet_group.groupname.name
  username = "nii"
  password = "12345678"
  parameter_group_name = "psiph"
  availability_zone = "eu-west-2a"
  publicly_accessible = true
  skip_final_snapshot = true
  


}

#VPC SUBNET GROUP CONFIG
resource "aws_db_subnet_group" "groupname" {
  name       = "leap"
  subnet_ids = [aws_subnet.pri1.id, aws_subnet.pri3.id]
  
  tags = {
    Name = "leap"
  }
}

