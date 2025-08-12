module "ec2_instance" {
  source          = "./modules/ec2_instance"
  ami_id          = data.aws_ami.amazon_linux_AMI.id
  instance_type   = local.instance_type
  security_groups = [module.security_groups.security_group_name]
  tags            = local.tags
  user_data       = local.user_data
}


module "security_groups" {
  source      = "./modules/security_group"
  name        = local.security_group_name
  description = "security group for webserver"
  tags        = local.tags
  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTP from anywhere"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow SSH from anywhere"
    }
  ]
}
