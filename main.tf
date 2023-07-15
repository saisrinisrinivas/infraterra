terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "my-terr-state-buck"
    key    = "Infra/Statefile"
    region = "ap-south-1"
    dynamodb_table = "Infra"
  }

}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}


module "ecr" {
  source = "./modules/ecrs"

  name                  = "terraform"
  project_family        = "terras"
  environment           = "dev"
  image_tag_mutability  = "MUTABLE"
  scan_on_push          = true
  expiration_after_days = 7
  additional_tags = {
    Project     = "ECRDemo"
    Owner       = "devops"
    Purpose     = "xyxyxyx"
    Description = "Random"
  }
}
