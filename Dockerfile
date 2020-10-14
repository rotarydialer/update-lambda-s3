FROM python:3.7-alpine

LABEL "com.github.actions.name"="Update lambda from S3"
LABEL "com.github.actions.description"="Deploy a lambda's code from a zip in a S3 bucket"
LABEL "com.github.actions.icon"="truck"
LABEL "com.github.actions.color"="lightgreen"

LABEL version="0.1.0"
LABEL repository="https://github.com/rotarydialer/update-lambda-s3"
LABEL homepage="https://github.com/rotarydialer/update-lambda-s3"
LABEL maintainer="rotarydialer"

# https://github.com/aws/aws-cli/blob/master/CHANGELOG.rst
ENV AWSCLI_VERSION='1.16.232'

RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}

ADD deploy-lambda.sh /deploy-lambda.sh
ENTRYPOINT ["/deploy-lambda.sh"]
