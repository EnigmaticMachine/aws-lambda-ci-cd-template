# AWS Lambda CI/CD and Terraform Deployment Template

A complete template for deploying Python code to AWS Lambda using a CI/CD pipeline. It includes everything you need to get started, from infrastructure setup with Terraform to containerizing your application with Docker. This template is designed to be a starting point for more complex and advanced code and deployments.

## Overview

This project demonstrates how to deploy a Python application as an AWS Lambda function using a fully automated CI/CD pipeline and manage the required infrastructure using Terraform. The key components include:

- **GitHub**: Version control and CI/CD automation using GitHub Actions.
- **Terraform**: Infrastructure as Code (IaC) to provision AWS resources.
- **AWS**: Services including Lambda, and ECR.
- **Docker**: Containerization of the Python application.

## Architecture

```mermaid
flowchart LR
    A[Developer Pushes Code to GitHub] --> B[GitHub Actions Triggered]
    B --> C[Build Docker Image]
    C --> D[Push Docker Image to ECR]
    D --> E[Update Lambda Function with New Image]
    E --> F[Lambda Function Deployed]

    A --> G[GitHub Actions Triggered for Terraform]
    G --> H[Terraform Initializes]
    H --> I[Terraform Plans Infrastructure]
    I --> J[Terraform Applies Changes]

    subgraph AWS Infrastructure
        direction TB
        J --> S3[Create S3 Bucket for Terraform State]
        J --> ECR[Create ECR Repository]
        J --> LAMBDA[Create Lambda Function]
        J --> IAM[Create IAM Role and Policies]
    end

    subgraph Local Development
        direction TB
        C
        D
    end

    subgraph GitHub
        direction TB
        B
        G
    end

    subgraph AWS Lambda Deployment
        direction TB
        E
        F
    end

    subgraph Terraform Process
        direction TB
        H
        I
        J
    end
```

The system design emphasizes:

- **Replicability**: Ensuring the environment can be reproduced easily.
- **Automation**: Minimizing manual steps in the deployment process.
- **Everything as Code**: Managing infrastructure and pipelines using code for consistency and version control.
- **Self-Documentation**: Using code to document the system, making it easier to understand and maintain.

## Prerequisites

- AWS Account
- AWS CLI configured with appropriate permissions
- GitHub account


## Usage

After deploying, your Lambda function will be accessible via AWS console.


## Contributing

Contributions are welcome! Please fork this repository and submit pull requests with any improvements or bug fixes.
