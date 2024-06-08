# The "resource" block defines an AWS Lambda function.
resource "aws_lambda_function" "lambda_function" {

  # The "function_name" attribute specifies the name of the Lambda function.
  function_name = "my-lambda-function"

  # The "role" attribute specifies the Amazon Resource Name (ARN) of the IAM role that the Lambda function assumes when it executes.
  # This role grants the Lambda function the necessary permissions to interact with other AWS services.
  role = aws_iam_role.lambda_exec.arn

  # The "image_uri" attribute specifies the URI of the Docker image stored in Amazon ECR.
  # This image contains the code and dependencies for the Lambda function.
  image_uri = "${aws_ecr_repository.repo.repository_url}:latest"

  # The "package_type" attribute specifies the type of deployment package.
  # Setting it to "Image" indicates that the Lambda function is deployed using a container image.
  package_type = "Image"
}

# The "resource" block defines an IAM role that the Lambda function will assume when it executes.
resource "aws_iam_role" "lambda_exec" {

  # The "name" attribute specifies the name of the IAM role.
  name = "lambda-exec-role"

  # The "assume_role_policy" attribute specifies the policy that grants an entity permission to assume the role.
  # The policy is defined in JSON format and specifies that the Lambda service (lambda.amazonaws.com) can assume this role.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# The "resource" block attaches a managed policy to the IAM role.
resource "aws_iam_role_policy_attachment" "lambda_policy" {

  # The "role" attribute specifies the name of the IAM role to which the policy will be attached.
  role = aws_iam_role.lambda_exec.name

  # The "policy_arn" attribute specifies the Amazon Resource Name (ARN) of the managed policy.
  # In this case, it attaches the AWSLambdaBasicExecutionRole policy, which grants basic Lambda execution permissions, including writing logs to Amazon CloudWatch.
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# These resources work together to define a Lambda function that runs a containerized application,
# with appropriate permissions to interact with other AWS services and manage its own execution.
