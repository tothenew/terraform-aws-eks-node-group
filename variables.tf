
variable "cluster_name" {

 default = "testing-cluster" 
}

variable "node_group_name" {
 default = "testing-node-group"
}

variable "subnet_ids" {
    type = list
    default = ["subnet-055eb434f841c1ec7", "subnet-082d1b94bacae6504", "subnet-05dec220d2885f6dd"]
}


variable "instance_types" {
    type = list
    default = ["t3.medium", "t2.medium"]
}

variable "desired_size" {
    default = 2

}

variable "max_size" {

    default = 4
}

variable "min_size" {

    default = 1
}


