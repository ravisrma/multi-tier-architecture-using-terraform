#database subnet group
resource "aws_db_subnet_group" "my_db_subnet_group" {
    name       = var.db_subnet_group_name
    subnet_ids = [aws_subnet.private_db_subnet_1.id, aws_subnet.private_db_subnet_2.id]
    tags = {
        Name = var.db_subnet_group_name
    }
}

#database instance
resource "aws_db_instance" "my_db_instance" {
    allocated_storage    = var.db_allocated_storage
    storage_type         = var.db_storage_type
    engine               = var.db_engine
    engine_version       = var.db_engine_version
    instance_class       = var.db_instance_class
    username             = var.db_username
    password             = var.db_password
    parameter_group_name = "default.mysql5.7"
    skip_final_snapshot = true
    #final_snapshot_identifier = "${var.db_instance_name}-final-snapshot"
    db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
    vpc_security_group_ids = [aws_security_group.db-sg.id]
    multi_az = true
    tags = {
        Name = var.db_instance_name
    }
}