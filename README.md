# Terraform AWS Labs

This repository contains a collection of hands-on Terraform labs focused on provisioning AWS resources. Each folder represents an individual task with a specific goal, such as launching EC2 instances, configuring S3 buckets, setting up SQS queues, SNS topics, CloudFront distributions, SES, and more.

## 📌 Purpose

The purpose of this project is to strengthen practical skills in Infrastructure as Code (IaC) using Terraform on AWS. Each lab is designed to be executed independently and covers a wide range of basic AWS services and configurations.

## 📁 Repository Structure

Each subfolder follows the naming pattern `task_<ID>_<name>` and includes `.tf` files, variable files, output files, and occasionally additional content like HTML or images.

## 🚀 How to Use

1. Navigate to a specific lab folder, e.g., `cd task_10001_ec2`
2. Initialize Terraform: `terraform init`
3. Apply the plan: `terraform apply`
4. Destroy the infrastructure if needed: `terraform destroy`

## ⚙️ Requirements

- Terraform >= 1.0
- AWS account with appropriate permissions
- AWS credentials configured via AWS CLI or environment variables

## 📝 Notes

This repository is intended for practice and learning purposes. Some files such as `terraform.tfstate` and `terraform.tfvars` are included for simplicity, but in real-world projects, it's recommended to exclude them using a proper `.gitignore`.

---

Auto-generated document - 2025-08-05
