
variable "aws_region" {
  description = "AWS region where the infrastructue will be deployed"
  type        = string
  default     = "ca-central-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "development"
}

variable "helai_video" {
  description = "Name of the project"
  type        = string
  default     = "helai-videography"
}

vairable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}


