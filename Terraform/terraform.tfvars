#--------------- Locals -------------------

v_required_tags01 = {
  "Project" = "Terraform"
}
v_org_name = "abc"
v_env      = "dev"
v_loc_abrv = "vm"
#-------------------Resource Group ------------------------

rg_name  = "rg"
location = "eastus"

#-------------------Network Security Group -----------------

security_rule = [{
  access                                     = "Allow"
  description                                = "Inbound Rule"
  destination_address_prefix                 = "*"
  destination_address_prefixes               = ["*"]
  destination_application_security_group_ids = null
  destination_port_range                     = "443"
  destination_port_ranges                    = null
  direction                                  = "Inbound"
  name                                       = "allow-http"
  priority                                   = 100
  protocol                                   = "Tcp"
  source_address_prefix                      = "*"
  source_address_prefixes                    = null
  source_application_security_group_ids      = null
  source_port_range                          = "*"
  source_port_ranges                         = null
  },
  {
    access                                     = "Allow"
    description                                = "Outbound Rule"
    destination_address_prefix                 = "*"
    destination_address_prefixes               = ["*"]
    destination_application_security_group_ids = null
    destination_port_range                     = "443"
    destination_port_ranges                    = null
    direction                                  = "Outbound"
    name                                       = "Outbound-http"
    priority                                   = 110
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = null
    source_application_security_group_ids      = null
    source_port_range                          = "*"
    source_port_ranges                         = null
}]

nsg_name = "logicapp-nsg"

#------------- Route table -------------------------

route_table_name  = "logicapp-routetable"
route_propagation = false
route = [{
  address_prefix = "10.0.0.0/8"
  name           = "route1"
  next_hop_type  = "None"
}]

#---------------VNET-----------------------------------

vnet_template_name = "Vnets-Template"
vnet_name          = "logicapp-Vnet"
subnet1_name       = "logicapp-outbound"
deployment_mode    = "Incremental"

#---------------- Storage Account --------------------------

storage_name                    = "storage01"
account_tier                    = "Standard"
account_replication_type        = "LRS"
account_kind                    = "StorageV2"
min_tls_version                 = "TLS1_2"
public_network_access_enabled   = true
allow_nested_items_to_be_public = false
enable_https_traffic_only       = true
access_tier                     = "Hot"
storage_default_action          = "Deny"
storage_type                    = "SystemAssigned"

#------------------ NIC-------------------------------------------

nic_name                      = "dev-nic"
private_ip_address_allocation = "Dynamic"

#-----------------------VM------------------------------
vm_name              = "VM01"
vm_size              = "Standard_F2"
admin_username       = "azureuser"
admin_password       = "Azure@123456789"
caching              = "ReadWrite"
storage_account_type = "Standard_LRS"
publisher            = "Canonical"
offer                = "0001-com-ubuntu-server-focal"
sku                  = "20_04-lts"
vm_version              = "latest"

ip_allocation_method = "Static"
ipname = "testip"