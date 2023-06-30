resource "azurerm_network_interface" "example" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ipname
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}

output "id" {
  value = azurerm_network_interface.example.id
}