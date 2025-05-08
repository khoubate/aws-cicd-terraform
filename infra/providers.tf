
terraform {
  required_version = ">= 1.4.6, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Using remote backend
terraform {
  backend "s3" {
    bucket = "lab-backend-devops-terraform"
    key    = "flaskappawsec2/tfstate"
    region = "us-east-1"
  }
}
