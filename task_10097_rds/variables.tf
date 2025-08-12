/* variable "access_key" {
  description = "Access key to AWS console"
  sensitive   = true
  type        = string

}
variable "secret_key" {
  description = "Secret key to AWS console"
  sensitive   = true
  type        = string
} */
variable "region" {
  description = "AWS region"
  type        = string
  validation {
    condition     = var.region == "us-east-1"
    error_message = "This lab only accepts us-east-1 region"
  }

}
