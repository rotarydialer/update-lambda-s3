# GitHub Action to `aws s3 cp` a file to an S3 Bucket 🔄 

This simple action uses the [vanilla AWS CLI](https://docs.aws.amazon.com/cli/index.html) to cp a file (either from your repository or generated during your workflow) to a remote S3 bucket.



## Usage

Place in a `.yml` file such as this one in your `.github/workflows` folder. Refer to the documentation on [workflow YAML syntax](https://help.github.com/en/articles/workflow-syntax-for-github-actions) for further details.

### `workflow.yml` Example

```
name: Deploy lambda from S3

on:
  push:
    branches: [master]

jobs:
  lambda:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - uses: rotarydialer/update-lambda
        env:
          LAMBDA_NAME: example-lambda-function
          AWS_S3_BUCKET: example-lambda-builds-bucket
          AWS_S3_KEY: /builds/example-lambda.v1.0.0.zip
          AWS_SECRET_ID: ${{ secrets.AWS_SECRET_ID }}
          AWS_SECRET_KEY: ${{ secrets.AWS_SECRET_KEY }}
          AWS_REGION: ${{ secrets.AWS_REGION }}
```

### Required Environment Variables

| Key | Value | Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `LAMBDA_NAME` | The name of the lambda you wish to update. | `env` | **Yes** |
| `AWS_S3_BUCKET` | The name of the bucket where the zip file is stored. For example, `my-lambda-builds-bucket`. | `env` | **Yes** |
| `AWS_S3_KEY` | The location (path and filename) of the zip file on S3. For example, `/builds/my-lambda.v1.0.0.zip`. | `env` | **Yes** |
| `AWS_REGION` | The region where your lambda and bucket reside. For example, `us-east-1`. [Full list of regions here.](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions) | `env` | **Yes** |
| `AWS_ACCESS_KEY_ID` | Your AWS Access Key. [More info here.](https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html) | `env` | **Yes** |
| `AWS_SECRET_ACCESS_KEY` | Your AWS Secret Access Key. [More info here.](https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html) | `env` | **Yes** |
