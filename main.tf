provider "azurerm" {
  version = "2.1.0"
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

