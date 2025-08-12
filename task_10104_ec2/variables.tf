variable "access_key" {
  description = "Access key to AWS console"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Secret key to AWS console"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Region of AWS VPC"
  type        = string
  validation {
    condition     = var.region == "us-east-1"
    error_message = "Only us-east-1 accepted for this lab"
  }
}


