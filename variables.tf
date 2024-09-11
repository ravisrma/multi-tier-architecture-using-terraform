variable "vpc_name" {
    type = string
}
variable "vpc_cidr_block" {
    type = string
}
variable "subnet1_az" {
    type = string
}
variable "subnet2_az" {
    type = string
}
variable "pub_web_subnet1_name" {
    type = string
}
variable "pub_web_subnet2_name" {
    type = string
}
variable "pub_web_subnet1_cidr_block" {
    type = string
}
variable "pub_web_subnet2_cidr_block" {
    type = string
}
variable "pri_app_subnet1_name" {
    type = string
}
variable "pri_app_subnet2_name" {
    type = string
}
variable "pri_app_subnet1_cidr_block" {
    type = string
}
variable "pri_app_subnet2_cidr_block" {
    type = string
}
variable "pri_db_subnet1_name" {
    type = string
}
variable "pri_db_subnet2_name" {
    type = string
}
variable "pri_db_subnet1_cidr_block" {
    type = string
}
variable "pri_db_subnet2_cidr_block" {
    type = string
}
variable "ssh-locate" {
    type = string
}
variable "web_sg_name" {
    type = string
}
variable "app_sg_name" {
    type = string
}
variable "db_sg_name" {
    type = string
}
variable "igw_name" {
    type = string
}
variable "nat_gw_name" {
    type = string
}
variable "instance_type" {
    type = string
}
variable "ami_id" {
    type = string
}
variable "region" {
    type = string
}
variable "key_name" {
    type = string
}
variable "device_name" {
    type = string
}
variable "volume_size" {
    type = number
}
variable "volume_type" {
    type = string
}
variable "delete_on_termination" {
    type = bool
}
variable "resource_type" {
    type = string
}
variable "max_size" {
    type = number
}
variable "min_size" {
    type = number
}
variable "desired_capacity" {
    type = number
}
variable "web_asg_name" {
    type = string
}
variable "web_lc_name" {
    type = string
}
variable "web_lb_name" {
    type = string
}
variable "web_tg_name" {
    type = string
}
variable "app_lc_name" {
    type = string
}
variable "app_asg_name" {
    type = string
}
variable "app_lb_name" {
    type = string
}
variable "app_tg_name" {
    type = string
}
variable "bastion-sg-name" {
    type = string
}
variable "db_subnet_group_name" {
    type = string
}
variable "db_allocated_storage" {
    type = number
}
variable "db_storage_type" {
    type = string
}
variable "db_engine" {
    type = string
}
variable "db_engine_version" {
    type = string
}
variable "db_instance_class" {
    type = string
}
variable "db_instance_name" {
    type = string
}
variable "db_username" {
    type = string
}
variable "db_password" {
    type = string
}
variable "alb_sg_name" {
    type = string
}
