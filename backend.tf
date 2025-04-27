terraform {

  backend "azurerm" {

    resource_group_name = "tfstate-tbc"

    storage_account_name = "tbc9482"

    container_name = "tfstate"

    key = "dev.terraform.tfstate"

  }

}