####========LOCAL TAGS===============================
locals {
  required_tags = var.v_required_tags01
  org_name      = var.v_org_name
  env           = var.v_env
  location_abrv = var.v_loc_abrv
}
###---------------- RG1 --------------------------------------

module "resource_group" {
  source              = "../Resources/Resource_Group"
  resource_group_name = "${local.org_name}-${local.location_abrv}-${local.env}-${var.rg_name}"
  location            = var.location
  tags                = local.required_tags
}

#-------------------- Network security group & Rules ------------------------

module "NSG" {
  source              = "../Resources/NSG"
  name                = var.nsg_name
  location            = module.resource_group.rg_location
  resource_group_name = module.resource_group.rg_name
  security_rule       = var.security_rule
}


#---------------------- Route Table -------------------------------------------

module "Route_Table" {
  source                        = "../Resources/Route_table"
  name                          = var.route_table_name
  location                      = module.resource_group.rg_location
  resource_group_name           = module.resource_group.rg_name
  disable_bgp_route_propagation = var.route_propagation
  route                         = var.route
}


#------------------- Vnet --------------------------------------------

resource "azurerm_resource_group_template_deployment" "VNET" {
  name                = var.vnet_template_name
  resource_group_name = module.resource_group.rg_name
  template_content    = file("../Resources/VNET/vnet_template.json")
  parameters_content = jsonencode(
    {
      "vnetName" = {
        value = var.vnet_name
      },
      "subnetName" = {
        value = var.subnet1_name
      },
      "networkSecurityGroups_logicapp_nsg_externalid" = {
        value = module.NSG.nsg_id
      },
      "routeTables_example_route_table_externalid" = {
        value = module.Route_Table.rt_id
      }
  })
  deployment_mode = var.deployment_mode
  depends_on      = [module.Route_Table, module.NSG]

}
#----------------Public IP-----------------------------
module "IP"{
  source                          = "../Resources/Public_Ip"
  name                = var.ipname
  resource_group_name             = module.resource_group.rg_name
  location                        = module.resource_group.rg_location
  allocation_method   = var.ip_allocation_method
}

#---------------- Storage acccount --------------------------


module "Storage_account" {
  source                          = "../Resources/Storage_Account"
  name                            = "${local.org_name}${local.location_abrv}${local.env}${var.storage_name}"
  resource_group_name             = module.resource_group.rg_name
  location                        = module.resource_group.rg_location
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  account_kind                    = var.account_kind
  min_tls_version                 = var.min_tls_version
  public_network_access_enabled   = var.public_network_access_enabled
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  enable_https_traffic_only       = var.enable_https_traffic_only
  access_tier                     = var.access_tier
  default_action                  = var.storage_default_action
  ip_rules                        = ["${chomp(data.http.myip.body)}"]
  virtual_network_subnet_ids      = [data.azurerm_subnet.subnet1.id]
  type                            = var.storage_type
  depends_on                      = [data.azurerm_subnet.subnet1]
}

#---------------- NIC-----------------------------------------------
module "NIC" {
  source                        = "../Resources/Network_Interface"
  name                          = var.nic_name
  resource_group_name           = module.resource_group.rg_name
  location                      = module.resource_group.rg_location
  ipname                        = var.ipname
  subnet_id                     = data.azurerm_subnet.subnet1.id
  private_ip_address_allocation = var.private_ip_address_allocation
}

#-----------------------VM---------------------------------------------

module "VM" {
  source               = "../Resources/Virtual_Machine"
  name                 = var.vm_name
  resource_group_name  = module.resource_group.rg_name
  location             = module.resource_group.rg_location
  size                 = var.vm_size
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  network_interface_id = module.NIC.id
  caching              = var.caching
  storage_account_type = var.storage_account_type
  publisher            = var.publisher
  offer                = var.offer
  sku                  = var.sku
}


