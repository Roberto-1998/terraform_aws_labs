data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "subnet1" {
  vpc_id            = data.aws_vpc.default.id
  availability_zone = "us-east-1a"
}

data "aws_subnet" "subnet2" {
  vpc_id            = data.aws_vpc.default.id
  availability_zone = "us-east-1b"
}