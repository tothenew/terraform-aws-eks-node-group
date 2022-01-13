#Node Group Module
module "node_group" {
  source = "./modules/node_group"
  cluster_name = var.cluster_name
  node_group_name = var.node_group_name
  subnet_ids      = var.subnet_ids
  instance_types  = var.instance_types
  desired_size           = var.desired_size 
  max_size               =  var.max_size
  min_size                = var.min_size
 
}
