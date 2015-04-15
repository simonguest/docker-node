#!/usr/bin/env bash

SHA1=$1

# Copy docker json to S3
DOCKERRUN_FILE=$SHA1-Dockerrun.aws.json
sed "s/<TAG>/$SHA1/" < Dockerrun.aws.json.template > $DOCKERRUN_FILE
aws s3 cp $DOCKERRUN_FILE s3://circleci-builds/$DOCKERRUN_FILE

# Create new application version
aws elasticbeanstalk create-application-version --application-name concur-ui --version-label $SHA1 --source-bundle S3Bucket=circleci-builds,S3Key=$DOCKERRUN_FILE

# Update environement to the new version
aws elasticbeanstalk update-environment --environment-name concur-ui-qa --version-label $SHA1