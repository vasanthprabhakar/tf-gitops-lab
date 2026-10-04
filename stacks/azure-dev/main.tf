variable "location" {
  description = "Azure region for the lab spoke."
  type        = string
  default     = "centralindia"
}

# The resource group is created by the platform team (az group create), not by this stack:
# the pipeline identity has Contributor on this group only.
data "azurerm_resource_group" "lab" {
  name = "rg-lab-gitops"
}

resource "azurerm_virtual_network" "spoke" {
  name                = "vnet-gitops-dev"
  resource_group_name = data.azurerm_resource_group.lab.name
  location            = var.location
  address_space       = ["10.40.0.0/22"]
  tags = {
    owner       = "platform"
    cost_center = "cc-200"
    managed_by  = "terraform"
  }
}

resource "azurerm_subnet" "app" {
  name                 = "snet-app"
  resource_group_name  = data.azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.spoke.name
  address_prefixes     = ["10.40.0.0/24"]
}

output "vnet_id" {
  value = azurerm_virtual_network.spoke.id
}
