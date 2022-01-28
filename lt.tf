resource "aws_launch_template" "ng_eks_launch_template" {
  name = "ng_eks_launch_template"

  vpc_security_group_ids  = ["sg-030888ba8b196acc4", "sg-024ac5730477138b4"]
  disable_api_termination = false
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 20
      volume_type = "gp2"
    }
  }

  image_id = "ami-0cb0ebf0188779ab1"
  #instance_type = "t3.medium"
  user_data = base64encode(templatefile("${path.module}/user-data-apache.sh", {}))
  #user_data = "${file("user-data-apache.sh")}"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "EKS-MANAGED-NODE"
    }
  }
}
