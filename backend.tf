terraform {
  backend "azurerm" {
    storage_account_name = "devops104"
    container_name       = "tfstate"
    key                  = "jenkins.tfstate"
    resource_group_name  = "devops"
  }
}
