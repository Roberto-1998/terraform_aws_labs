locals {
  tags = {
    Project     = "webserver-${terraform.workspace}"
    Environment = terraform.workspace
  }

  instance_type = terraform.workspace == "prod" ? "t3.micro" : "t2.micro"

  user_data_prod = <<-EOF
    #!/bin/bash
    sudo -su
    yum update -y
    yum install httpd -y
    systemctl start httpd
    systemctl enabled httpd
    echo "<html><h1> Welcome to Whizlabs. Happy Leaning from PROD...</h1></html>" >> /var/www/html/index.html
  EOF

  user_data_dev = <<-EOF
    #!/bin/bash
    sudo -su
    yum update -y
    yum install httpd -y
    systemctl start httpd
    systemctl enabled httpd
    echo "<html><h1> Welcome to Whizlabs. Happy Leaning from DEV...</h1></html>" >> /var/www/html/index.html
  EOF

  user_data = terraform.workspace == "prod" ? local.user_data_prod : local.user_data_dev


  base_ingress_rule = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTP from anywhere"
    },
  ]

  dynamic_ingress_rule = terraform.workspace == "prod" ? concat(local.base_ingress_rule, [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow SSH from anywhere"
    }
  ]) : local.base_ingress_rule


  security_group_name= "webserver-sg-${terraform.workspace}"

}