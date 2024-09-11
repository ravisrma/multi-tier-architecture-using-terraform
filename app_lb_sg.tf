# sg of alb
resource "aws_security_group" "app_lb_sg" {
    name        = "app_lb_sg"
    vpc_id      = aws_vpc.my_vpc.id
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        #security_groups = [aws_security_group.alb_sg.id]
        security_groups = [aws_security_group.web-sg.id]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "app_lb_sg"
    }
}