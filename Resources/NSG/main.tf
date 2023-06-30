resource "azurerm_network_security_group" "example" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
      for_each = var.security_rule
    content {
        name = security_rule.value["name"]
        priority = security_rule.value["priority"]
        direction = security_rule.value["direction"]
        access = security_rule.value["access"]
        protocol = security_rule.value["protocol"]
        source_port_range = security_rule.value["source_port_range"]
        destination_port_range = security_rule.value["destination_port_range"]
        source_address_prefix = security_rule.value["source_address_prefix"]
        destination_address_prefix = security_rule.value["destination_address_prefix"]
        destination_port_ranges                     = security_rule.value["destination_port_ranges"]
        destination_application_security_group_ids  = security_rule.value["destination_port_ranges"]


    }
  }
}
output "nsg_id" {
  description = "The ID of the Network Security Group."
  value       = azurerm_network_security_group.example.id
}
output "nsg_name" {
  description = "The name of the network security group."
  value       = azurerm_network_security_group.example.name
}