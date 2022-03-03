#IAM Variables

variable "node_role_arn" {
  description = "ARN of the IAM policy."
  type        = list(string)
  default     = []
  validation {
    condition = (
      length(var.node_role_arn) < 2
    )
    error_message = "You may not specify more than one `node_role_arn`."
  }
}

#Launch Template Variables

variable "lt_name" {
  description = "The name of the launch template. If blank, Terraform will auto-generate a unique name."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs to associate the Node Group with."
  type        = list(string)
}

variable "disable_api_termination" {
  description = "It enables EC2 Termination Protection, if it is true."
  type        = bool
}

variable "image_id" {
  description = "The AMI from which to launch the instance."
}

variable "key_name" {
  description = "SSH Key to access Instances."
  type        = string
}

variable volume_size {
  description = "Size of worker node"
  default     = "20"
}

variable volume_type {
  default = "gp2"
}






###new
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


