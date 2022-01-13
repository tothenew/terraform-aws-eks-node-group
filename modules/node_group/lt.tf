locals {
    common_tags = {
  ENV = "${terraform.workspace}"
  ManagedBy = "Terraform"
    }
}
resource "aws_launch_template" "ng_eks_launch_template" {
  name = "ng_eks_launch_template"
  vpc_security_group_ids  = var.vpc_security_group_ids
  disable_api_termination = false
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = var.volume_size
      volume_type = var.volume_type
    }
  }

  image_id = var.ami_id
  user_data = base64encode(templatefile("${path.module}/user-data-apache.sh", {}))

  tag_specifications {
    resource_type = "instance"

  tags = merge(
    local.common_tags,
    {
      "Name" = var.Name
    }
  )   
     
     
     }
  
  }

