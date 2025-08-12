variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "This module only accepts t2.micro or t3.micro instances"

  }
}

variable "instance_name" {
  description = "Instance Name"
  type        = string
  default     = null
}

variable "security_groups" {
  description = "List of Security Groups Names"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the instance"
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "Initial Script for the instance"
  type        = string
  default     = null
}