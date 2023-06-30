#Azure Resource Group Creation
resource "azurerm_resource_group" "rg" {
  name 	   = var.resource_group_name
  location = var.location
  tags	   = var.tags

  //   lifecycle {
  // ignore_changes = [tags]
  // }

}

output "rg_name" {
  description = "name of the provisioned resource group"
  value       = azurerm_resource_group.rg.name
}

output "rg_location" {
  description = "location of the provisioned resource group"
  value       = azurerm_resource_group.rg.location
}

