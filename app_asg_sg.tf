resource "aws_security_group" "app_asg_sg" {
    name        = "app_asg_sg"
    vpc_id      = aws_vpc.my_vpc.id
    # ingress {
    #     from_port = "-1"
    #     to_port   = "-1"
    #     protocol  = "icmp"
    #     security_groups  = [aws_security_group.web-sg.id]
    # }
    
    # ingress {
    #     from_port   = 80
    #     to_port     = 80
    #     protocol    = "tcp"
    #     security_groups = [aws_security_group.web-sg.id]
    # }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        security_groups = [aws_security_group.app_lb_sg.id]
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        security_groups = [aws_security_group.bas_sg.id]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
}
    tags = {
        name = "app_asg_sg"
    }
}