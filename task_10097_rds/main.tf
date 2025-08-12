module "security_group" {
  source                     = "./modules/security_group"
  security_group_vpc_id      = data.aws_vpc.default.id
  security_group_name        = local.security_group_name
  security_group_description = "Security group for RDS instance"
  tags                       = local.tags
  ingress_rules = [
    {
      cidr_block  = ["0.0.0.0/0"],
      from_port   = 3306
      to_port     = 3306
      ip_protocol = "tcp"
      description = "Ingress for MYSQL Port"
    }
  ]
}


module "rds_mysql" {
  source                    = "./modules/rds_mysql"
  mysql_database_password   = "mydatabasepassword"
  mysql_database_user       = "mydatabaseuser"
  mysql_publicly_accessible = true
  rds_allocated_storage     = local.rds_allocated_storage
  vpc_security_group_ids    = [module.security_group.security_group_id]
  rds_instance_type         = local.rds_instance_type
  tags                      = local.tags
  subnet_ids                = [data.aws_subnet.subnet1.id, data.aws_subnet.subnet2.id]
  rds_subnet_group_name     = local.rds_subnet_group_name
}