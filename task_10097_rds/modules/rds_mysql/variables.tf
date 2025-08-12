variable "rds_subnet_group_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "rds_allocated_storage" {
  type = number
}

variable "rds_instance_type" {
  type = string
  validation {
    condition     = contains(["db.t3.micro", "db.t2.micro"], var.rds_instance_type)
    error_message = "This RDS only admits low cost instances"
  }
}

variable "mysql_database_user" {
  type = string
}

variable "mysql_database_password" {
  type = string
}

variable "mysql_publicly_accessible" {
  type = bool
}

variable "vpc_security_group_ids" {
  type = list(string)
}


