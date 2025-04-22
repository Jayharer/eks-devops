resource "aws_ecr_repository" "particle41_ecr_repo" {
  name                 = "particle41_ecr_repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}