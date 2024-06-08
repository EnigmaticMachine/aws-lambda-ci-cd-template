# The 'json' module is imported to handle JSON data.
# This module will be used to convert the response body to a JSON formatted string.
import json

# The 'lambda_handler' function is the entry point for the AWS Lambda function.
# AWS Lambda will invoke this function whenever the Lambda function is triggered.
# The function takes two parameters:
# - 'event': This parameter contains information about the event that triggered the Lambda function.
# - 'context': This parameter provides runtime information to the Lambda function.
def lambda_handler(event, context):

    # The function returns a dictionary, which represents the HTTP response.
    # The 'json.dumps' function is used to convert the string 'Hello, World!' to a JSON formatted string.
    return {
        'statusCode': 200,
        'body': json.dumps('Hello, World!')
    }

# This simple Lambda function, when triggered, will return an HTTP response with a status code of 200
# and a JSON body containing the message 'Hello, World!'.
# This kind of function is often used as a starting point for more complex Lambda function.
