terraform {
  backend "azurerm" {
    storage_account_name = "devops104"
    container_name       = "tfstate"
    key                  = "jenkins-1.tfstate"
    resource_group_name  = "devops"
  }
}
