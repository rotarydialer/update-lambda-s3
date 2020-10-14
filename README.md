# GitHub Action: Deploy Lambda from a zip in an S3 Bucket

This action uses the [AWS CLI](https://docs.aws.amazon.com/cli/index.html) to update a lambda function's code from a zip stored in an S3 bucket.

This is in contrast to many other actions, which will deploy only a local zip file. The main benefits of this approach, in the author's opinion, are:

1. Allows for asynchronous build and deploy phases.
2. Allows for the deployment of larger file sizes.

## Usage

Place in a `.yml` file (e.g., `deploy-lambda.yml`) in your `.github/workflows` folder. See the example below. Refer to the documentation on [workflow YAML syntax](https://help.github.com/en/articles/workflow-syntax-for-github-actions) for further details.

### Example

```
name: Deploy lambda from S3

on:
  push:
    branches: [main]

jobs:
  lambda:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: rotarydialer/update-lambda-s3@main
        env:
          LAMBDA_NAME: example-lambda-function
          AWS_S3_BUCKET: example-lambda-builds-bucket
          AWS_S3_KEY: builds/example-lambda.v1.0.0.zip
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_REGION: ${{ secrets.AWS_REGION }}
```

### Required Environment Variables

| Key | Value | Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `LAMBDA_NAME` | The name of the lambda you wish to update. | `env` | **Yes** |
| `AWS_S3_BUCKET` | The name of the bucket where the zip file is stored. For example, `my-lambda-builds-bucket`. | `env` | **Yes** |
| `AWS_S3_KEY` | The location (path and filename) of the zip file on S3. For example, `/builds/my-lambda.v1.0.0.zip`. | `env` | **Yes** |
| `AWS_REGION` | The region where your lambda and bucket reside. For example, `us-east-1`. | `env` | **Yes** |
| `AWS_ACCESS_KEY_ID` | Your AWS access key ID. | `env` | **Yes** |
| `AWS_SECRET_ACCESS_KEY` | Your AWS secret access key. | `env` | **Yes** |
