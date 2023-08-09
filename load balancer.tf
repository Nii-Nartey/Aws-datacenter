#Target group config
resource "aws_lb_target_group" "web-target-group" {
    health_check {
      interval             = 10
      path                 = "/"
      protocol             = "HTTP"
      timeout              = 5
      healthy_threshold    = 5
      unhealthy_threshold = 2
    }

  name     = "web-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.range.id
  target_type = "instance"
}



#ALB Config
resource "aws_lb" "web-load-balancer" {
  name               = "lb-tf"
  internal           = false
  load_balancer_type = "application"
  ip_address_type = "ipv4"
  security_groups    = [aws_security_group.pass.id]
  subnets            = [aws_subnet.pub1.id,aws_subnet.pub3.id]

  tags ={
    Name = "web-lb"
  }
}


#creating listener
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.web-load-balancer.arn
  port              = "80"
  protocol          = "HTTP"
 

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-target-group.arn
  }
}

#lb attachment
resource "aws_lb_target_group_attachment" "ec2-attach-2" {
  target_group_arn = aws_lb_target_group.web-target-group.arn
  target_id        = aws_instance.web.id
}

#lb attachment
resource "aws_lb_target_group_attachment" "ec2-attach" {
  target_group_arn = aws_lb_target_group.web-target-group.arn
  target_id        = aws_instance.weba.id
}