resource "aws_lb" "app-lb" {
    name               = var.app_lb_name
    internal           = true
    load_balancer_type = "application"
    security_groups    = [aws_security_group.app_lb_sg.id]
    subnets            = [aws_subnet.private_app_subnet_1.id, aws_subnet.private_app_subnet_2.id]
    tags = {
        Name = var.app_lb_name
    }
}
resource "aws_lb_target_group" "app-tg" {
    name     = var.app_tg_name
    port     = 80
    protocol = "HTTP"
    vpc_id   = aws_vpc.my_vpc.id
    tags = {
        Name = var.app_tg_name
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

resource "aws_lb_listener" "app-lb-listener" {
    load_balancer_arn = aws_lb.app-lb.arn
    port              = "80"
    protocol          = "HTTP"
    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.app-tg.arn
    }
}

resource "aws_autoscaling_attachment" "app-asg-attachment" {
    autoscaling_group_name = aws_autoscaling_group.app-asg.name
    lb_target_group_arn   = aws_lb_target_group.app-tg.arn
  
}
