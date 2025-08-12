resource "aws_db_subnet_group" "mydb-subnet-group" {
  name       = var.rds_subnet_group_name
  subnet_ids = var.subnet_ids
  tags       = var.tags
}

resource "aws_db_instance" "myinstance" {
  allocated_storage      = var.rds_allocated_storage
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.rds_instance_type
  username               = var.mysql_database_user
  password               = var.mysql_database_password
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  publicly_accessible    = var.mysql_publicly_accessible
  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.mydb-subnet-group.name
}