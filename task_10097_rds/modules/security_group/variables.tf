variable "security_group_name" {
  description = "Security group name for MySql server"
  type        = string
}

variable "security_group_description" {
  description = "Security group description for MySql server"
  type        = string
}

variable "security_group_vpc_id" {
  description = "Security group VPC ID for MySql server"
  type        = string
  default     = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "ingress_rules" {
  type = list(object({
    cidr_block  = list(string)
    from_port   = string
    to_port     = string
    ip_protocol = string
    description = string
  }))
}