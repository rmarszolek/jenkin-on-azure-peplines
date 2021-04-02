terraform {
  backend "azurerm" {
    storage_account_name = "devops104"
    container_name       = "tfstate"
    key                  = "${var.prefix}.tfstate"
    resource_group_name  = "devops"
  }
}
