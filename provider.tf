terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.72"
      region = "us-west-2"
      default_tags {
        tags = {
          Environment = var.environment
          Project     = var.project
    }
  }
        
    }
  }
}
