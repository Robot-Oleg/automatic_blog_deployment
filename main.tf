provider "aws" {
  region = "eu-west-1"
}

resource "aws_apprunner_service" "blog" {
#   depends_on = [time_sleep.waitrolecreate]
  service_name = "blog"

  source_configuration {
    image_repository {
      image_configuration {
        port = "1313"
      }
      image_identifier = var.ecr_image
      image_repository_type = "ECR"
    }
    authentication_configuration {
      access_role_arn = var.access_role
    }
    auto_deployments_enabled = true
  }

  tags = {
    Name = "blog"
  }
}

variable "ecr_image" {
  description = "docker image pushed to ecr"
}

variable "access_role" {
  description = "access role arn for private ecr"
}

output "blog_url" {                            
  value = aws_apprunner_service.blog                          
}