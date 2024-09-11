# sg of alb
resource "aws_security_group" "alb_sg" {
    name        = var.alb_sg_name
    vpc_id      = aws_vpc.my_vpc.id
    # ingress {
    #     from_port   = "0"
    #     to_port     = "0"
    #     protocol    = "-1"
    #     cidr_blocks = ["0.0.0.0/0"]
    # }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}