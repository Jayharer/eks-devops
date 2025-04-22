// outputs.tf
output "infrastructure_output" {
  value = {
    aws_account_id  = data.aws_caller_identity.current.account_id
    ecr_repo_name = aws_ecr_repository.particle41_ecr_repo.name
    ecr_repo_url = aws_ecr_repository.particle41_ecr_repo.repository_url
    vpc_id = aws_vpc.particle41_vpc.id
  }
}