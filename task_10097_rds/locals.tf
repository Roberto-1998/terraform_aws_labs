locals {
  tags = {
    Project     = "MySQL Server"
    Environment = terraform.workspace
  }

  rds_subnet_group_name = "mydb-subnet-group-${terraform.workspace}"

  security_group_name = "rds-sg-${terraform.workspace}"

  rds_instance_type     = terraform.workspace == "prod" ? "db.t3.micro" : "db.t2.micro"
  rds_allocated_storage = terraform.workspace == "prod" ? 40 : 20
}


