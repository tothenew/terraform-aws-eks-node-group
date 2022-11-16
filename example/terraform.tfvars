region              = "us-east-1"
profile             = "tothenew"
project_name_prefix = "tothenew"
common_tags = {
  "Feature" : "application"
}
project = "tothenew"

cluster_name            = "eks-cluster"
disable_api_termination = false
image_id                = ""
key_name                = "tothenew"
node_group_name         = "eks_node_group"
instance_types          = ["t3.medium", "t2.medium"]
max_size                = 1
desired_size            = 1
min_size                = 1
create_eks_iam_role     = false
lt_name                 = "lt"
volume_size             = "50"
volume_type             = "gp3"
node_role_arn           = [""]
