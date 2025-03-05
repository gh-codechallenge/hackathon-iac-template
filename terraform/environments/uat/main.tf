data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

locals {
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  tags                = data.azurerm_resource_group.this.tags
}