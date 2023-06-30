resource "azurerm_route_table" "example" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation

  dynamic "route" {
       for_each = var.route
    content {
    name           = route.value["name"]
    address_prefix = route.value["address_prefix"]
    next_hop_type  = route.value["next_hop_type"]
  }
  }
}

output "rt_id" {
  description = "Id of Route Table"
  value       = azurerm_route_table.example.id
}