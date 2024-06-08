# The FROM instruction initializes a new build stage and sets the Base Image for subsequent instructions.
# This base image is a publicly available AWS Lambda image for Python 3.12.
# The public.ecr.aws/lambda/python:3.12 image includes the AWS Lambda runtime for Python 3.12,
# which allows you to build Lambda functions that can be deployed directly to AWS Lambda.
FROM public.ecr.aws/lambda/python:3.12

# The COPY instruction copies files from the host file system into the image's file system.
# Here, it copies the lambda_function.py file from the ./app directory on the host to the LAMBDA_TASK_ROOT directory in the image.
# ${LAMBDA_TASK_ROOT} is an environment variable defined by the base image that points to the directory
# where AWS Lambda looks for the handler code.
COPY ./app/lambda_function.py ${LAMBDA_TASK_ROOT}

# The CMD instruction provides the default command to run when the container starts.
# Here, it specifies the handler function for the AWS Lambda function, which is lambda_function.lambda_handler.
# When AWS Lambda invokes the function, it will call the lambda_handler function defined in the lambda_function.py file.
CMD [ "lambda_function.lambda_handler" ]

# This Dockerfile sets up the environment to run a Python-based AWS Lambda function.
# By using the AWS Lambda runtime base image and specifying the handler function, it ensures that the container
# can be deployed directly to AWS Lambda and execute the specified function.
