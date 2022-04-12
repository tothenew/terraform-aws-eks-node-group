provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project
    }
  }
}