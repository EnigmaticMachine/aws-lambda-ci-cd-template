# The "provider" block configures the provider that Terraform will use to interact with the AWS services.
# Providers are responsible for understanding API interactions and exposing resources.
# Providers are a key concept in Terraform, as they are responsible for managing the lifecycle of resources.

provider "aws" {

  # The "region" attribute specifies the AWS region where the resources will be created.
  # This ensures that all AWS resources managed by Terraform will be created in the specified region.
  region = "eu-central-1"
}


# The AWS provider configuration is essential for Terraform to know where and how to create resources in AWS.
# It ensures that all the operations performed by Terraform are directed to the specified AWS region.
