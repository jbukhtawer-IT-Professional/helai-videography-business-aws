resource "aws_db_subnet_group" "rds" {
  name = "${var.project_name}-rds-subnet-group"

  subnet_ids = [
    aws_subnet.private.id,
    aws_subnet.private_2.id
  ]

  tags = {
    Name = "${var.project_name}-rds-subnet-group"
  }
}


resource "aws_db_instance" "main" {
  identifier  = "${var.project_name}-database"

  engine          = "mysql"
  engine_version  = "8.4"

  instance_class  = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = "helai"
  username = "admin"
  password = var.db_password

  db_subnet_group_name  = aws_db_subnet_group.rds.name
  vpc_security_group_ids  = [aws_security_group.rds.id]

  publicly_accessible = false

  skip_final_snapshot  = true

  tags  = {
    Name = "${var.project_name}-database"
  }
}
  
