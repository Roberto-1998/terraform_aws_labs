resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = var.security_groups

  tags = merge(
    {
      Name = var.instance_name
    },
    var.tags
  )

  user_data = var.user_data
}

