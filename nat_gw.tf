resource "aws_eip" "my_eip" {
    domain = "vpc"
}
resource "aws_nat_gateway" "my_nat_gw" {
    allocation_id = aws_eip.my_eip.id
    subnet_id     = aws_subnet.public_web_subnet_1.id
    tags = {
        Name = var.nat_gw_name
    }
}
