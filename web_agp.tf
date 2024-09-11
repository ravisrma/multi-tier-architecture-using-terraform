#ASG for web/per
resource "aws_launch_configuration" "web_launch_configuration" {
    name = var.web_lc_name
    image_id = var.ami_id
    instance_type = var.instance_type
    security_groups = [aws_security_group.web-sg.id]
    key_name = var.key_name
    user_data = file("${path.module}/user-data.sh")
    associate_public_ip_address = true
    lifecycle {
        create_before_destroy = true
    }
    root_block_device {
        volume_size = var.volume_size
        volume_type = var.volume_type
        delete_on_termination = var.delete_on_termination
    }
}

resource "aws_autoscaling_group" "web_asg" {
    name = var.web_asg_name
    max_size = var.max_size
    min_size = var.min_size
    desired_capacity = var.desired_capacity
    launch_configuration = aws_launch_configuration.web_launch_configuration.id
    vpc_zone_identifier = [aws_subnet.public_web_subnet_1.id, aws_subnet.public_web_subnet_2.id]
}