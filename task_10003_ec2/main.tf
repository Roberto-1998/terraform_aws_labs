provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_s3_bucket" "blog" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "object1" {
  for_each     = fileset("html/", "*")
  bucket       = aws_s3_bucket.blog.id
  key          = each.value
  source       = "html/${each.value}"
  etag         = filemd5("html/${each.value}")
  content_type = "text/html"
}


resource "aws_security_group" "web-sg" {
  name = "Web-SG"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}



resource "aws_instance" "web" {
  ami                    = "ami-02e136e904f3da870"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  iam_instance_profile   = "EC2_Role_259938.15661753015781"
  user_data              = <<EOF
      #!/bin/bash
    sudo su
    yum update -y
    yum install httpd -y
    aws s3 cp s3://${aws_s3_bucket.blog.id}/index.html/var/www/html/index.html
    systemctl start httpd
    systemctl enable httpd
    EOF
  tags = {
    Name = "Whiz-EC2-Instance"
  }
}