# Versioned Deployment via SSM Parameter Store + S3

## 📦 Overview
This project demonstrates how to:
- Build and zip a Node.js app using GitHub Actions
- Push versioned artifacts to S3
- Store latest version metadata in SSM Parameter Store
- EC2 reads latest version from SSM and pulls build from S3

## 🧰 Tools Used
- GitHub Actions
- AWS SSM Parameter Store
- AWS S3
- Node.js
- Terraform

## 🔁 CI/CD Flow
1. Developer pushes code
2. GitHub Actions:
   - Zips app as `app-<version>.zip`
   - Uploads to `s3://my-app-bucket/builds/`
   - Updates `/myapp/release/latest_version` in SSM

## 🖥️ EC2 Bootstrap
Each EC2 on boot:
- Reads latest version from SSM
- Downloads corresponding zip from S3
- Runs the app

## 🧪 Test it
```bash
cd scripts/
bash build_and_push.sh
```

Then launch EC2 with `ec2_user_data.sh` as user_data.