environment = "testing"
project     = "open source contribution"

#node_role_arn = ["arn:aws:iam::230914246429:role/user-nodegroup"]
lt_name                 = "ng_eks_launch_template"
vpc_security_group_ids  = [""]
disable_api_termination = false
image_id                = ""
key_name                = "gocd_user"


##node group

cluster_name    = "mycluster"
node_group_name = "myfirstnodegroup"
subnet_ids      = ["subnet-055eb434f841c1ec7", "subnet-082d1b94bacae6504", "subnet-05dec220d2885f6dd"]
instance_types  = ["t3.medium", "t2.medium"]
desired_size    = 2
max_size        = 4
min_size        = 1
