generate_hcl "_terramate_generated_providers.tf" {
  content {
    terraform {
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 5.87.0"
        }
      }
    }

    provider "aws" {
      region = global.aws_region
    }
  }
}
