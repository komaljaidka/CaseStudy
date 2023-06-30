resource "azurerm_storage_account" "example" {
  name                            = var.name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  account_kind                    = var.account_kind
  min_tls_version                 = var.min_tls_version
  public_network_access_enabled   = var.public_network_access_enabled
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  enable_https_traffic_only       = var.enable_https_traffic_only
  access_tier                     = var.access_tier
  network_rules {
   
    default_action             = var.default_action
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }
  identity {
    
    type = var.type
  }

}

output "storage_accnt_id" {
  value = azurerm_storage_account.example.id
}
output "storage_accnt_connectionstring" {
  value = azurerm_storage_account.example.primary_connection_string
}
output "storage_accnt_name" {
  value = azurerm_storage_account.example.name
}
output "storage_accnt_accesskey" {
  value = azurerm_storage_account.example.primary_access_key
}

