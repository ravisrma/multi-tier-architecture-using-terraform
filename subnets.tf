# public subnet 1
resource "aws_subnet" "public_web_subnet_1" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = var.pub_web_subnet1_cidr_block
    availability_zone       = var.subnet1_az
    map_public_ip_on_launch = true
    tags = {
        Name = var.pub_web_subnet1_name
    }
}
# public subnet 2
resource "aws_subnet" "public_web_subnet_2" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = var.pub_web_subnet2_cidr_block
    availability_zone       = var.subnet2_az
    map_public_ip_on_launch = true
    tags = {
        Name = var.pub_web_subnet2_name
    }
}
# private subnet 1
resource "aws_subnet" "private_app_subnet_1" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = var.pri_app_subnet1_cidr_block
    availability_zone       = var.subnet1_az
    map_public_ip_on_launch = false
    tags = {
        Name = var.pri_app_subnet1_name
    }
}
# private subnet 2
resource "aws_subnet" "private_app_subnet_2" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = var.pri_app_subnet2_cidr_block
    availability_zone       = var.subnet2_az
    map_public_ip_on_launch = false
    tags = {
        Name = var.pri_app_subnet2_name
    }
}
# private subnet 3
resource "aws_subnet" "private_db_subnet_1" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = var.pri_db_subnet1_cidr_block
    availability_zone       = var.subnet1_az
    map_public_ip_on_launch = false
    tags = {
        Name = var.pri_db_subnet1_name
    }
}
# private subnet 4
resource "aws_subnet" "private_db_subnet_2" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = var.pri_db_subnet2_cidr_block
    availability_zone       = var.subnet2_az
    map_public_ip_on_launch = false
    tags = {
        Name = var.pri_db_subnet2_name
    }
}
# End of subnets.tf
