resource "aws_lb_target_group" "target_group" {
  name        = "whiz-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.default.id
  target_type = "instance"

  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}


resource "aws_lb" "application-lb" {
  name               = "whiz-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web-server.id]
  ip_address_type    = "ipv4"
  subnets = [
    data.aws_subnet.subnet1.id,
    data.aws_subnet.subnet2.id
  ]

  tags = {
    Name = "whiz-labs"
  }
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.application-lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.target_group.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "ec2_attach" {
  count            = length(aws_instance.web-server)
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.web-server[count.index].id
}