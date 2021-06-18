resource "aws_ecr_repository" "fly" {
  name = "fly"
  tags = merge(
    local.common_tags,
    { DockerHub : "dwpdigital/fly" }
  )
}

resource "aws_ecr_repository_policy" "fly" {
  repository = aws_ecr_repository.fly.name
  policy     = data.terraform_remote_state.management.outputs.ecr_iam_policy_document
}

output "ecr_example_url" {
  value = aws_ecr_repository.fly.repository_url
}
