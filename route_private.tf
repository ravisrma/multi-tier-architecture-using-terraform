resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.my_nat_gw.id
        }
}

#app tier
resource "aws_route_table_association" "nat_route_1" {
    subnet_id      = aws_subnet.private_app_subnet_1.id
    route_table_id = aws_route_table.private_route_table.id
}
resource "aws_route_table_association" "nat_route_2" {
    subnet_id      = aws_subnet.private_app_subnet_2.id
    route_table_id = aws_route_table.private_route_table.id
}

#db tier
resource "aws_route_table_association" "nat_route_db_1" {
    subnet_id      = aws_subnet.private_db_subnet_1.id
    route_table_id = aws_route_table.private_route_table.id
}
resource "aws_route_table_association" "nat_route_db_2" {
    subnet_id      = aws_subnet.private_db_subnet_2.id
    route_table_id = aws_route_table.private_route_table.id
}
