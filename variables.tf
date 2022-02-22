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

variable "name" {
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
