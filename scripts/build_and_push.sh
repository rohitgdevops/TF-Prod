#!/bin/bash
VERSION="1.0.$(date +%s)"
zip -r app-$VERSION.zip app/
aws s3 cp app-$VERSION.zip s3://my-app-bucket/builds/
aws ssm put-parameter --name "/myapp/release/latest_version" --value "$VERSION" --type "String" --overwrite