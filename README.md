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
