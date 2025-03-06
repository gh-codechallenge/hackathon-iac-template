# High-Level Guide: Using GitHub Actions with AWS Resources

## Overview

GitHub Actions provides a CI/CD automation platform that can be used to interact with AWS resources for deployments, infrastructure automation, and application management. This guide covers key concepts and steps for setting up GitHub Actions to connect to AWS.

## Prerequisites

- An **AWS account** with necessary permissions.
- **IAM user or role** with programmatic access.
- **GitHub repository** with a workflow configured.
- **AWS CLI installed** (optional for local testing).

## Step 1: Configure AWS Credentials

### Using AWS Access Keys (Recommended for Non-Production)

Store the AWS credentials as **GitHub Secrets**:

1. Go to your GitHub repository.
2. Navigate to **Settings > Secrets and variables > Actions**.
3. Add the following secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - (Optional) `AWS_REGION`

## Step 2: Create a GitHub Actions Workflow

Create a `.github/workflows/aws-deployment.yml` file in your repository:

```yaml
name: AWS Deployment

on:
  push:
    branches:
      - main

permissions:
  id-token: write
  contents: read

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v3
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ secrets.AWS_REGION }}

      - name: Test AWS Connection
        run: aws sts get-caller-identity
```

## Step 3: Common AWS Use Cases

### 1. Deploy to AWS S3

```yaml
- name: Deploy to S3
  run: |
    aws s3 sync ./public s3://my-bucket-name --delete
```

### 2. Deploy an Application to AWS Lambda

```yaml
- name: Deploy Lambda Function
  run: |
    zip function.zip index.js
    aws lambda update-function-code --function-name myLambdaFunction --zip-file fileb://function.zip
```

### 3. Deploy to Amazon ECS

```yaml
- name: Deploy to ECS
  run: |
    aws ecs update-service --cluster my-cluster --service my-service --force-new-deployment
```

## Step 4: Security Best Practices

- Restrict IAM permissions to **only necessary actions**.
- Rotate credentials periodically if using access keys.
- Use **GitHub Environments and secrets** to control deployments.

## Conclusion

GitHub Actions is a powerful tool for automating AWS workflows, whether deploying applications, managing infrastructure, or running automated tasks. By integrating GitHub Actions with AWS, you can create scalable, secure, and efficient CI/CD pipelines.
