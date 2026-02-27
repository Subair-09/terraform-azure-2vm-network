variable "location" {
  default = "East US"
}

variable "rg_name" {
  default = "rg-2vm-network"
}

variable "admin_username" {
  default = "azureuser"
}

variable "admin_password" {
  sensitive = true
}

variable "vm_size" {
  default = "Standard_D2s_v3"
}