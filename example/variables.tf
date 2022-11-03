variable "project" {
    description = "Environment Tag value"
    type        = string
}

variable "lt_name" {
    description = "The name of the launch template. If blank, Terraform will auto-generate a unique name."
    type        = string
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
    default     = "gp3"
}

variable "Name" {
    default = "EKS-MANAGED-NODE"
}

variable "cluster_name" {
    description = "The name of the EKS cluster"
    type        = string
}

variable "node_group_name" {
    description = "The name of the EKS cluster"
    type        = string
}

variable "instance_types" {
    description = "Instance types to use for this node group."
    type        = list(string)
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

variable "region" {
    type        = string
    description = "A string value for Launch resources in which AWS Region"
}

variable "profile" {
    type        = string
    description = "A string value for setting AWS Profile"
}

variable "project_name_prefix" {
    type        = string
    description = "A string value to describe prefix of all the resources"
}

variable "common_tags" {
    type        = map(string)
    description = "A map to add common tags to all the resources"
}

variable "cluster_service_ipv4_cidr" {
    description = "The CIDR block to assign Kubernetes service IP addresses from. If you don't specify a block, Kubernetes assigns addresses from either the 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks. Refer terraform doc for understanding requirements that the CIDR Block should meet."
    type        = string
    default     = null
}

variable "ip_family" {
    description = "The IP family used to assign Kubernetes pod and service addresses. Valid values are ipv4 (default) and ipv6. You can only specify an IP family when you create a cluster, changing this value will force a new cluster to be created."
    type        = string
    default     = null
}

variable "create_eks_iam_role" {
    description = "Node Security Group ID"
    type        = bool
    default     = false
}

variable "subnet_ids" {
    description = "A list of subnet IDs to launch resources in"
    type        = list(string)
}

variable "vpc_security_group_ids" {
    description = "List of security group IDs to associate the Node Group with."
    type        = list(string)
}

variable "node_role_arn" {
    description = "Role to be attached to node"
    type        = list(string)
}
