resource "aws_instance" "bastion" {
    ami           =  var.ami_id
    instance_type = var.instance_type
    subnet_id     = aws_subnet.public_web_subnet_1.id
    security_groups = [aws_security_group.bas_sg.id]
    key_name = var.key_name

    tags = {
        Name = "BastionHost"
    }
}