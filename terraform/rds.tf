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
