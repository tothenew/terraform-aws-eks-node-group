resource "aws_launch_template" "ng_eks_launch_template" {
  name = var.name

  vpc_security_group_ids  = var.vpc_security_group_ids
  disable_api_termination = var.disable_api_termination
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 20
      volume_type = "gp2"
    }
  }

  image_id  = var.image_id
  user_data = base64encode(templatefile("${path.module}/user-data-apache.sh", {}))
  #user_data = "${file("user-data-apache.sh")}"
  key_name = var.key_name

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "EKS-MANAGED-NODE"
    }
  }
}
