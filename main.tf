
provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  version         = "~> 2.0"
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "resources" {
  name     = "${var.prefix}-rg"
  location = var.location
  tags = {
        environment = "${var.environmenttag}"
    }
}

