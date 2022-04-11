# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 0.14.9"
}
provider "azurerm" {
  features {}
}

# Create the resource group
resource "azurerm_resource_group" "rg-dagprd" {
  name     = "rg-dagprd"
  location = "uksouth"
}

# Create the Linux App Service Plan
resource "azurerm_app_service_plan" "asp-dagprd" {
  name                = "asp-dagprd"
  location            = azurerm_resource_group.rg-dagprd.location
  resource_group_name = azurerm_resource_group.rg-dagprd.name
  sku {
    tier = "premium"
    size = "P1"
  }
}
# Create the web app, pass in the App Service Plan ID, and deploy code from a public GitHub repo
resource "azurerm_app_service" "app-dagprd" {
  name                = "app-dagprd"
  location            = azurerm_resource_group.rg-dagprd.location
  resource_group_name = azurerm_resource_group.rg-dagprd.name
  app_service_plan_id = azurerm_app_service_plan.asp-dagprd.id


connection_string {
    name  = "Database"
    type  = "SQLAzure"
    value = "server=tcp:sql-dagprd.database.windows.net;database=dagprdfull;UID=app;Encrypt=True;TrustServerCertificate=False;Authentication=Active Directory Interactive"
  }
 
}