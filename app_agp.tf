resource "aws_launch_configuration" "app-launch-configuration" {
    name = var.app_lc_name
    image_id = var.ami_id
    instance_type = var.instance_type
    security_groups = [aws_security_group.app_asg_sg.id]
    key_name = var.key_name
    # user_data = <<-EOF
    #             #!/bin/bash
    #             sudo apt update -y
    #             sudo apt upgrade -y
    #             sudo apt install mysql-server -y
    #             sudo systemctl start mysql
    #             sudo systemctl enable mysql                
    #             EOF
    user_data = file("${path.module}/db-data.sh")
    associate_public_ip_address = false
    lifecycle {
        create_before_destroy = true
    }
    root_block_device {
        volume_size = var.volume_size
        volume_type = var.volume_type
        delete_on_termination = var.delete_on_termination
    }
}

resource "aws_autoscaling_group" "app-asg" {
    name = var.app_asg_name
    max_size = var.max_size
    min_size = var.min_size
    desired_capacity = var.desired_capacity
    launch_configuration = aws_launch_configuration.app-launch-configuration.id
    vpc_zone_identifier = [aws_subnet.private_app_subnet_1.id, aws_subnet.private_app_subnet_2.id]
}