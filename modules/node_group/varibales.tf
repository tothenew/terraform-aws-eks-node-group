variable "Name" {
    default = "EKS-MANAGED-NODE"
}

########Node Group
variable "cluster_name" {
  
}

variable "node_group_name" {

}

variable "subnet_ids" {
    type = list
}

variable "instance_types" {
    type = list
}


variable "desired_size" {

}

variable "max_size" {

}

variable "min_size" {

}


##########Lt



variable "vpc_security_group_ids" {
    type = list
    default = ["sg-030888ba8b196acc4", "sg-024ac5730477138b4"]
}
variable volume_size {

  default     = "20"
  description = "Size of worker node"
}

variable volume_type {
  default = "gp2"
}

variable "ami_id" {
  default = "ami-047a7967ea0436232"
}
