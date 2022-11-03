data "template_file" "launch_template_user_data" {
    template = file("${path.module}/user-data-apache.sh")
    vars = {
        cluster_name = var.cluster_name
    }
}

resource "aws_launch_template" "ng_eks_launch_template" {
  name = var.lt_name

  vpc_security_group_ids  = var.vpc_security_group_ids
  disable_api_termination = var.disable_api_termination
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = var.volume_size
      volume_type = var.volume_type
    }
  }

  image_id  = var.image_id
      user_data = base64encode(data.template_file.launch_template_user_data.rendered)
  #user_data = "${file("user-data-apache.sh")}"
  key_name = var.key_name

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.cluster_name
    }
  }
}
