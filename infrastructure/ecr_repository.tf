# The "resource" block is used to define a resource that Terraform will manage.
# In this case, we are defining an AWS Elastic Container Registry (ECR) repository.

resource "aws_ecr_repository" "repo" {

  # The "name" attribute specifies the name of the ECR repository.
  # This is a unique name within your AWS account where Docker images will be stored.
  name = "my-ecr"
}

# Detailed Explanation:
# ECR is a fully managed Docker container registry that makes it easy for developers to store,
# manage, and deploy Docker container images.

# Once created, you can push Docker images to this repository, and later, pull those images to
# deploy on AWS services like ECS (Elastic Container Service) or Lambda (if using container images
# for Lambda functions).
