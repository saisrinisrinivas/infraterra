# main.tf

resource "aws_ecr_repository" "ecr_repository" {
  name                 = "${var.project_family}/${var.environment}/${var.name}"
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = merge(
    var.additional_tags,
    {
      ManagedBy = "Terraform"
      Environment = "${var.environment}"
    }
  )
}

