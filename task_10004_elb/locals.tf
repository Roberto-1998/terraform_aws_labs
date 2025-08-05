locals {
  subnets = [data.aws_subnet.subnet1.id, data.aws_subnet.subnet2.id]
}