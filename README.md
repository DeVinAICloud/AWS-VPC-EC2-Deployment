# AWS Infrastructure: VPC & Automated EC2 Web Deployment

## Project Overview
This project demonstrates the manual and automated setup of a secure, public-facing web infrastructure on AWS. I architected a custom Virtual Private Cloud (VPC) to host a Node.js application, ensuring proper network isolation and security.

## Architecture Highlights
* **Networking**: Custom VPC with a `/16` CIDR block, public subnets, and an Internet Gateway.
* **Security**: Configured Stateful Security Groups to allow inbound HTTP (80) and HTTPS (443) traffic.
* **Automation**: Utilized Bash scripting via EC2 User Data to automate the installation of Node.js and application dependencies upon instance launch.
* **Identity & Access**: Implemented IAM Instance Profiles to allow the EC2 instance to securely fetch application code from S3.

## Deployment Steps
1. **Network Setup**: Created VPC, Subnets, and Route Tables.
2. **Security**: Defined firewall rules in Security Groups.
3. **Provisioning**: Launched an EC2 (Amazon Linux 2023) instance.
4. **Bootstrapping**: Applied the `scripts/install_web_app.sh` script during launch.

## Skills Demonstrated
* AWS Cloud Infrastructure
* Linux Administration
* Network Security (ACLs/Security Groups)
* Automation & Scripting

## How to Replicate This Environment
Follow these steps to deploy the web application using the provided automation script.

1. Prerequisites
An AWS Account with an existing S3 Bucket containing your app.zip and npm-cache.tar.gz.

An IAM Role (Instance Profile) with AmazonS3ReadOnlyAccess permissions.

2. Network Configuration
Create a VPC (CIDR 10.10.0.0/16).

Create a Public Subnet and attach an Internet Gateway.

Ensure your Route Table has a route (0.0.0.0/0) pointing to the Internet Gateway.

3. Security Group Setup
Create a Security Group named WebAppSG with the following rules:

Inbound: Allow HTTP (Port 80) and HTTPS (Port 443) from 0.0.0.0/0.

Outbound: Allow all traffic (or restrict to Port 53 for DNS and S3 Prefix Lists for higher security).

4. Launching the Instance
AMI: Amazon Linux 2023.

Instance Type: t3.micro.

Network: Select your custom VPC and Public Subnet.

Public IP: Set to Enable.

IAM Instance Profile: Select the role created in Step 1.

5. Bootstrap the Server
In the Advanced Details section, copy the contents of scripts/deploy-webapp.sh and paste it into the User Data field.

Note: Ensure you update the S3_BUCKET variable in the script with your specific bucket name.

6. Verification
Once the instance status checks pass, copy the Public IPv4 address and paste it into your browser using http://
