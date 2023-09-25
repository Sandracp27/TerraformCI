terraform {
    required_version = " >= 1.3.0"
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = ">=3.43.0"
        }
   }
}
locals {
    tags = {
        "Enviroment" = var.Enviroment
    }
}

resource "azurerm_storage_account" "securestorage" {
  resource_group_name      = var.resource_group_name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = var.Enviroment == "production" ? "GRS" : "LRS"
  public_network_access_enable =false

  tags = locals.tags
}