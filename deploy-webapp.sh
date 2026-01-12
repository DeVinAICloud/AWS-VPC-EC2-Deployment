#!/bin/bash

# =================================================================
# Script Name: deploy-webapp.sh
# Description: Automates the installation of Node.js and deploys 
#              a web application on Amazon Linux 2023.
# =================================================================

# Exit immediately if a command exits with a non-zero status
set -xe

# 1. Update system and install Node.js 20
echo "Installing Node.js..."
dnf install nodejs20 nodejs20-npm -y

# 2. Define the S3 Bucket source (Replace with your actual bucket name)
# In a real-world scenario, this could be passed as an environment variable
S3_BUCKET="YOUR_S3_BUCKET_NAME_HERE"

# 3. Prepare NPM cache to speed up installation
echo "Downloading NPM cache from S3..."
aws s3 cp s3://${S3_BUCKET}/npm-cache.tar.gz /var/cache/npm-cache.tar.gz

echo "Extracting cache..."
mkdir -p /root/.npm
tar xzf /var/cache/npm-cache.tar.gz -C /root/.npm/

# 4. Download and deploy the Web Application code
echo "Downloading application source code..."
mkdir -p /var/app/
aws s3 cp s3://${S3_BUCKET}/app.zip /var/app/app.zip

echo "Extracting application..."
unzip /var/app/app.zip -d /var/app/

# 5. Install dependencies and start the server
echo "Starting application..."
cd /var/app
npm install --offline
npm start
