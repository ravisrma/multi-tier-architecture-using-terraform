resource "aws_lb" "wb-lb" {
    name               = var.web_lb_name
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.alb_sg.id]
    subnets            = [aws_subnet.public_web_subnet_1.id, aws_subnet.public_web_subnet_2.id]
    tags = {
        Name = var.web_lb_name
    }
}
resource "aws_lb_target_group" "web-tg" {
    name     = var.web_tg_name
    port     = 80
    protocol = "HTTP"
    vpc_id   = aws_vpc.my_vpc.id
    tags = {
        Name = var.web_tg_name
    }
    health_check {
        interval            = 30
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = 10
        healthy_threshold   = 3
        unhealthy_threshold = 3
    }
}

resource "aws_lb_listener" "web-lb-listener" {
    load_balancer_arn = aws_lb.wb-lb.arn
    port              = "80"
    protocol          = "HTTP"
    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.web-tg.arn
    }
}

resource "aws_autoscaling_attachment" "web-asg-attachment" {
    autoscaling_group_name = aws_autoscaling_group.web_asg.name
    lb_target_group_arn   = aws_lb_target_group.web-tg.arn
  
}