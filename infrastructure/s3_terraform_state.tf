# The "resource" block defines an AWS S3 bucket that will be managed by Terraform.
# This bucket will be used to store the Terraform state file.

resource "aws_s3_bucket" "terraform_state" {

  # The "bucket" attribute specifies the name of the S3 bucket.
  # The bucket name must be globally unique across all existing bucket names in AWS.
  bucket = "tf-state-7f64b4a07ae248be9de66e56c9b3f942"

  # The "tags" block allows you to assign metadata to the S3 bucket in the form of key-value pairs.
  # Tags help organize and manage resources, making them easier to identify and filter.
  tags = {
    Name        = "My bucket"   # The "Name" tag gives a human-readable name to the bucket.
    Environment = "Dev"         # The "Environment" tag indicates that this bucket is for the development environment.
  }
}

# The S3 bucket defined here is used to store the Terraform state file.
# Storing the state file in S3 ensures that it is centrally managed, versioned, and accessible by multiple users or systems,
# which is especially important in a team environment or for CI/CD pipelines.
