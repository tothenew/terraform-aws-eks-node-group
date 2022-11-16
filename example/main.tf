module "eks_node_group" {
  source                  = "git@github.com:tothenew/terraform-aws-eks-node-group.git"
  lt_name                 = "${local.project_name_prefix}-${var.lt_name}"
  node_role_arn           = var.node_role_arn
  vpc_security_group_ids  = [var.vpc_security_group_ids]
  disable_api_termination = var.disable_api_termination
  image_id                = var.image_id
  key_name                = var.key_name
  cluster_name            = var.cluster_name
  node_group_name         = var.node_group_name
  subnet_ids              = [var.subnet_ids]
  instance_types          = var.instance_types
  desired_size            = var.desired_size
  max_size                = var.max_size
  min_size                = var.min_size
  environment             = terraform.workspace
  project                 = var.project
  tags                    = merge(local.common_tags, tomap({ "Name" : "${local.project_name_prefix}-ng" }))
}
