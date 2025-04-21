
variable "AWS_REGION" {
  description = "AWS Region"
  type    = string
  # default = "us-east-1"
}

variable "AWS_ADMIN_USER_ARN" {
  description = "AWS IAM admin user arn"
  type    = string
  # default = "arn:aws:iam::861936062471:user/jay"
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  # default = "particle41-eks"
}

