#!/usr/bin/env bash

SHA1=$1

# Copy docker json to S3
DOCKERRUN_FILE=$SHA1-Dockerrun.aws.json
sed "s/<TAG>/$SHA1/" < Dockerrun.aws.json.template > $DOCKERRUN_FILE

# Copy the deployment to S3
aws s3 cp $DOCKERRUN_FILE s3://circleci-builds/$DOCKERRUN_FILE

# Create new application version
aws elasticbeanstalk create-application-version --application-name $EB_APPLICATION_NAME --version-label $SHA1 --source-bundle S3Bucket=circleci-builds,S3Key=$DOCKERRUN_FILE

# Update environement to the new version
aws elasticbeanstalk update-environment --environment-name $EB_ENVIRONMENT_NAME --version-label $SHA1