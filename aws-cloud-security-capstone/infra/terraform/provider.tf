variable "aws_region" {
  description = "AWS region for this environment"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Short project identifier used in resource names"
  type        = string
  default     = "cloud-security-capstone"
}

provider "aws" {
  region = var.aws_region
}
