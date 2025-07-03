#!/bin/bash
apt update -y
apt install -y nodejs npm awscli unzip
mkdir -p /app

VERSION=$(aws ssm get-parameter --name "/myapp/release/latest_version" --query "Parameter.Value" --output text)

aws s3 cp s3://my-app-bucket/builds/app-$VERSION.zip /tmp/app.zip
unzip -o /tmp/app.zip -d /app/
cd /app
npm install
npm start