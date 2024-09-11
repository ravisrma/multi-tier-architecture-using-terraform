resource "aws_security_group" "web-sg" {
    vpc_id = aws_vpc.my_vpc.id
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        #cidr_blocks = ["0.0.0.0/0"]
        security_groups = [aws_security_group.alb_sg.id]
    }
    # ingress {
    # from_port = "0"
    # to_port   = "0"
    # protocol  = "-1"
    # }
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        security_groups = [aws_security_group.bas_sg.id]   
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        name = var.web_sg_name
    }
}
