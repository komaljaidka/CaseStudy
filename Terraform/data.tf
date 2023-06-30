data "azurerm_resource_group" "example" {
  name       = "${local.org_name}-${local.location_abrv}-${local.env}-${var.rg_name}"
  depends_on = [module.resource_group]
}
data "azurerm_network_security_group" "example" {
  name                = var.nsg_name
  resource_group_name = "${local.org_name}-${local.location_abrv}-${local.env}-${var.rg_name}"
  depends_on          = [module.NSG]
}
data "azurerm_route_table" "example" {
  name                = var.route_table_name
  resource_group_name = "${local.org_name}-${local.location_abrv}-${local.env}-${var.rg_name}"
  depends_on          = [module.Route_Table]
}
data "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  resource_group_name = "${local.org_name}-${local.location_abrv}-${local.env}-${var.rg_name}"
  depends_on          = [resource.azurerm_resource_group_template_deployment.VNET]
}
data "azurerm_subnet" "subnet1" {
  name                 = var.subnet1_name
  virtual_network_name = data.azurerm_virtual_network.example.name
  resource_group_name  = "${local.org_name}-${local.location_abrv}-${local.env}-${var.rg_name}"
  depends_on           = [resource.azurerm_resource_group_template_deployment.VNET]
}
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
data "azurerm_storage_account" "example" {
  name                = "${local.org_name}${local.location_abrv}${local.env}${var.storage_name}"
  resource_group_name = "${local.org_name}-${local.location_abrv}-${local.env}-${var.rg_name}"
  depends_on          = [module.Storage_account]
}