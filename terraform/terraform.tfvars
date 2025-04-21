eks_cluster_name = "particle41-eks"
AWS_REGION = "us-east-1"
AWS_ADMIN_USER_ARN = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/jay"

