#!/bin/sh
set -e

mkdir -p ~/.aws
touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

aws lambda update-function-code --function-name ${LAMBDA_NAME} \
    --s3-bucket ${AWS_S3_BUCKET} --s3-key ${AWS_S3_KEY} \
    --region ${AWS_REGION} 

rm -rf ~/.aws
