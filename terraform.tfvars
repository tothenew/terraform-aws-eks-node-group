#node_role_arn = ["arn:aws:iam::230914246429:role/user-nodegroup"]
name                    = "ng_eks_launch_template"
vpc_security_group_ids  = ["sg-030888ba8b196acc4", "sg-024ac5730477138b4"]
disable_api_termination = false
image_id                = "ami-0cb0ebf0188779ab1"
key_name                = "gocd_user"