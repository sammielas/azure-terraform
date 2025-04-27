# readme.md
# Scalable Web Application Infrastructure on Azure

This Terraform project deploys a scalable web application infrastructure in Azure with:

- Virtual Machine Scale Set (VMSS) running Ubuntu 20.04 LTS
- Azure Load Balancer with public IP
- Auto-scaling based on CPU utilization
- Network Security Group restricting access

## Prerequisites

1. Azure CLI installed and logged in
2. Terraform installed
3. SSH key pair in ~/.ssh/

## Usage

1. Clone the repository
2. Create terraform.tfvars with your configuration
3. Run: