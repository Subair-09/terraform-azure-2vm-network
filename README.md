Terraform Azure 2-VM Network Infrastructure
https://img.shields.io/badge/terraform-%25235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white
https://img.shields.io/badge/azure-%25230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white
https://img.shields.io/badge/linux-%2523FCC624.svg?style=for-the-badge&logo=linux&logoColor=black

📋 Overview
This project demonstrates the deployment of a secure virtual network infrastructure on Microsoft Azure using Infrastructure as Code with Terraform and the AzureRM provider. The infrastructure provisions two Linux virtual machines within the same virtual network and subnet, configured to communicate securely using private IP addressing.

Key Highlights:

Infrastructure as Code implementation with Terraform

Secure network segmentation with NSG rules

Private IP-based VM communication

Production-ready modular architecture

🏗️ Architecture
The deployment creates a complete Azure network infrastructure with the following components:

text
┌─────────────────────────────────────┐
│         Resource Group              │
│  ┌─────────────────────────────┐   │
│  │      Virtual Network        │   │
│  │  ┌─────────────────────┐   │   │
│  │  │      Subnet         │   │   │
│  │  │  ┌───────────────┐  │   │   │
│  │  │  │     VM-1      │  │   │   │
│  │  │  └───────────────┘  │   │   │
│  │  │  ┌───────────────┐  │   │   │
│  │  │  │     VM-2      │  │   │   │
│  │  │  └───────────────┘  │   │   │
│  │  └─────────────────────┘   │   │
│  └─────────────────────────────┘   │
│  ┌─────────────────────────────┐   │
│  │    Network Security Group   │   │
│  └─────────────────────────────┘   │
└─────────────────────────────────────┘
Components Provisioned:
Azure Resource Group: Container for all resources

Virtual Network: Isolated network environment with custom address space

Subnet: Compute resource segment within the VNet

Network Security Group: Firewall rules controlling inbound and internal traffic

Linux Virtual Machines (2): Ubuntu instances with managed data disks

Network Interfaces: Private IP configuration with optional public IPs

Managed Data Disks: Additional storage attached to each VM

✨ Key Features
Infrastructure as Code: Complete infrastructure defined in HCL

Modular Design: Reusable Terraform modules for different components

Network Security: Granular NSG rules for traffic control

Private Communication: VM-to-VM communication over private IPs

State Management: Remote state support ready for team collaboration

Production Structure: Organized codebase following best practices

📁 Project Structure
text
terraform-azure-2vm-network/
├── main.tf              # Main configuration file
├── variables.tf         # Input variables
├── outputs.tf           # Output values
├── terraform.tfvars     # Variable values (excluded from git)
├── modules/             # Reusable modules
│   ├── networking/      # VNet and subnet configuration
│   ├── security/        # NSG and security rules
│   └── compute/         # VM and disk configuration
└── scripts/             # Helper scripts
    └── validate.sh      # Connectivity validation script
📋 Prerequisites
Before deploying this infrastructure, ensure you have:

Azure Subscription - Active subscription with sufficient permissions

Terraform (v1.0+) - Installation Guide

Azure CLI (v2.0+) - Installation Guide

Git - For version control

Basic Knowledge - Azure networking concepts

🚀 Deployment Instructions
1. Clone the Repository
bash
git clone https://github.com/yourusername/terraform-azure-2vm-network.git
cd terraform-azure-2vm-network
2. Authenticate with Azure
bash
az login
az account set --subscription "your-subscription-id"
3. Configure Variables
Create a terraform.tfvars file:

hcl
location       = "East US"
environment    = "dev"
vm_admin_user  = "azureuser"
vm_admin_ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC..."
4. Deploy Infrastructure
bash
# Initialize Terraform
terraform init

# Review the execution plan
terraform plan

# Apply the configuration
terraform apply -auto-approve
🔍 Connectivity Validation
Verify private IP communication between the virtual machines:

Method 1: Azure CLI Run Command
bash
# From VM-1 to VM-2
az vm run-command invoke \
  --resource-group rg-2vm-network \
  --name vm-1 \
  --command-id RunShellScript \
  --scripts "ping -c 4 $(az vm show --resource-group rg-2vm-network --name vm-2 --query 'privateIps' -o tsv)"
Method 2: Manual SSH Connection
bash
# Get VM-1 public IP
PUBLIC_IP=$(az vm show -d --resource-group rg-2vm-network --name vm-1 --query publicIps -o tsv)

# SSH into VM-1 and ping VM-2
ssh azureuser@$PUBLIC_IP
ping <vm-2-private-ip>
Expected Output:
text
PING 10.0.1.5 (10.0.1.5) 56(84) bytes of data.
64 bytes from 10.0.1.5: icmp_seq=1 ttl=64 time=1.23 ms
64 bytes from 10.0.1.5: icmp_seq=2 ttl=64 time=1.15 ms
🔒 Security Considerations
Security Measure	Implementation
State Security	Terraform state files excluded from Git (.gitignore)
Access Control	SSH key authentication (no passwords)
Network Isolation	Private IP communication within VNet
Traffic Filtering	NSG rules limiting inbound traffic
Provider Security	Provider binaries not tracked in Git
NSG Rules Configured:
SSH Access (Port 22) - Restricted to specified IP ranges

ICMP (Ping) - Allowed between VMs in the same subnet

Outbound Internet - Default allow for updates

📊 Outputs
After deployment, Terraform will output:

bash
Apply complete! Resources: 12 added, 0 changed, 0 destroyed.

Outputs:

resource_group_name = "rg-2vm-network"
vnet_name          = "vnet-2vm-network"
vm_1_private_ip    = "10.0.1.4"
vm_2_private_ip    = "10.0.1.5"
vm_1_public_ip     = "52.123.45.67"
vm_2_public_ip     = "52.123.45.68"
🛠️ Maintenance and Cleanup
Destroy Resources
To avoid ongoing charges, destroy the infrastructure when not needed:

bash
terraform destroy -auto-approve
Update Infrastructure
Modify variables and reapply:

bash
terraform apply
💡 Skills Demonstrated
Azure Infrastructure Deployment - End-to-end Azure resource provisioning

Terraform AzureRM Provider - Expert use of HashiCorp Configuration Language

Infrastructure as Code Design - Modular, reusable code architecture

Virtual Network Architecture - Subnet planning and IP addressing

Network Security Configuration - NSG rules and traffic control

Cloud Resource Automation - Complete infrastructure lifecycle management

Command-line Validation - Azure CLI integration for testing

📚 Additional Resources
Terraform AzureRM Provider Documentation

Azure Virtual Network Documentation

Network Security Groups Overview

🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to check the issues page.

📝 License
This project is MIT licensed.

👨‍💻 Author
Subair Nurudeen Adewale

Cloud / DevOps Engineer

Azure Infrastructure and Automation Specialist

GitHub

LinkedIn
