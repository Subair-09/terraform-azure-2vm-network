Terraform Azure 2-VM Network Infrastructure
Project Overview

This project demonstrates the deployment of a secure virtual network infrastructure on Microsoft Azure using Infrastructure as Code with Terraform and the AzureRM provider.

The infrastructure provisions two Linux virtual machines within the same virtual network and subnet, configured to communicate securely using private IP addressing. Network Security Group rules are implemented to control traffic and allow internal ICMP communication between the virtual machines.

This project reflects real-world cloud engineering practices including modular infrastructure design, network security configuration, and automated deployment validation.

Architecture

The deployment includes:

Azure Resource Group

Virtual Network with defined address space

Subnet for compute resources

Network Security Group with inbound and internal rules

Two Linux Virtual Machines

Network Interfaces and Public IP configuration (optional access)

Managed Data Disk attachment

Private IP-based VM-to-VM communication

Both virtual machines are deployed in the same subnet and validated for internal connectivity without exposing internal communication publicly.

Key Features

Infrastructure as Code using Terraform AzureRM provider

Modular Terraform architecture for reusability

Secure internal communication using private IPs

Network Security Group configuration for traffic control

Automated infrastructure provisioning

Azure CLI validation of network connectivity

Production-style repository structure

Project Structure
terraform-azure-2vm-network/
│
├── Modules/
│   ├── Network/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── linux_vm/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── README.md
Prerequisites

Azure Subscription

Terraform installed

Azure CLI installed

Authenticated Azure CLI session

Basic understanding of Azure networking

Login to Azure:

az login
Deployment Steps

Initialize Terraform:

terraform init

Preview infrastructure:

terraform plan

Deploy resources:

terraform apply
Connectivity Validation

The virtual machines communicate using private IP addresses within the same subnet.

Connectivity can be verified using Azure CLI Run Command:

az vm run-command invoke \
  --resource-group rg-2vm-network \
  --name vm-1 \
  --command-id RunShellScript \
  --scripts "ping -c 4 <vm-2-private-ip>"

Successful response confirms internal network communication.

Security Considerations

Terraform state files are excluded from version control

Provider binaries are not tracked in Git

Network access is controlled using Network Security Group rules

Internal communication occurs over private IP addresses

Skills Demonstrated

Azure Infrastructure Deployment

Terraform AzureRM Provider

Infrastructure as Code Design

Virtual Network Architecture

Network Security Configuration

Cloud Resource Automation

Command-line Infrastructure Validation

Author

Subair Nurudeen Adewale
Cloud / DevOps Engineer
Azure Infrastructure and Automation Specialist
