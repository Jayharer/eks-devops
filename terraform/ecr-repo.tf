resource "aws_ecr_repository" "particle41_ecr_repo" {
  name                 = "particle41_ecr_repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "AWS_ACCOUNT_ID" {
  value = data.aws_caller_identity.current.account_id
}

output "AWS_ECR_REPO_NAME" {
  value = aws_ecr_repository.particle41_ecr_repo.name
}