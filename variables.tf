variable "environment" {
  description = "Environment Tag value"
  type        = string
}

variable "project" {
  description = "Environment Tag value"
  type        = string
}

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

variable "volume_size" {
  description = "Size of worker node"
  default     = "20"
}

variable "volume_type" {
  description = "EBS Volume type of worker node"
  default     = "gp2"
}

variable "Name" {
  default = "EKS-MANAGED-NODE"
}

#Node Group

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch resources in"
  type        = list(string)
}

variable "instance_types" {
  description = "Instance types to use for this node group."
  type        = list(string)
  #type = list
  default = ["t3.medium", "t2.medium"]
}


variable "desired_size" {
  description = "Initial desired number of worker nodes (external changes ignored)"
  type        = number
  default     = 2

}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 4
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "tags" {
    description = "Tags"
    type        = map(string)
}
