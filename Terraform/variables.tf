#-------------Locals---------------------------------------------

variable "v_required_tags01" {
  type = map(string)
}
variable "v_org_name" {
  type = string
}
variable "v_env" {
  type = string
}
variable "v_loc_abrv" {
  type = string
}
#---------------Resource Group ------------------------------------

variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}

#--------------- Network Security Group ------------------------------

variable "nsg_name" {
  type = string
}
variable "security_rule" {
  description = "Security Rule"
  type = list(object({
    name                                       = string
    description                                = string
    priority                                   = number
    direction                                  = string
    access                                     = string
    protocol                                   = string
    source_port_range                          = string
    destination_port_range                     = string
    source_address_prefix                      = string
    destination_address_prefix                 = string
    source_address_prefixes                    = list(string)
    source_port_ranges                         = list(string)
    source_application_security_group_ids      = list(string)
    destination_address_prefixes               = list(string)
    destination_port_ranges                    = list(string)
    destination_application_security_group_ids = list(string)

  }))
}

#--------------- route Table --------------------

variable "route_table_name" {
  type = string
}
variable "route_propagation" {
  type = bool
}
variable "route" {
  type = list(object({
    name           = string
    address_prefix = string
    next_hop_type  = string

  }))
}

#------------------- Vnet --------------------------------------------

variable "vnet_template_name" {
  type = string
}
variable "vnet_name" {
  type = string
}
variable "subnet1_name" {
  type = string
}
variable "deployment_mode" {
  type = string

}

#------------------- Storage Account ------------------------

variable "storage_name" {
  type = string
}
variable "account_tier" {
  type = string
}
variable "account_replication_type" {
  type = string
}
variable "account_kind" {
  type = string

}
variable "min_tls_version" {
  type = string

}
variable "public_network_access_enabled" {
  type = bool
}
variable "allow_nested_items_to_be_public" {
  type = bool
}
variable "enable_https_traffic_only" {
  type = bool
}
variable "access_tier" {
  type = string

}
variable "storage_default_action" {
  type = string

}
# variable "storage_ip_rules" {
#   type = list(string)
# }
# variable "storage_virtual_network_subnet_ids" {
#     type = list(string)

# }
variable "storage_type" {
  type = string

}

#----------------------NIC-----------------------------
variable "nic_name" {
  type = string
}
variable "private_ip_address_allocation" {
  type = string
}

#-----------------------VM------------------------------
variable "vm_name" {
  type = string
}
variable "vm_size" {
  type = string
}
variable "admin_username" {
  type = string
}
variable "admin_password" {
  type = string
}
variable "caching" {
  type = string
}
variable "storage_account_type" {
  type = string
}
variable "publisher" {
  type = string
}
variable "offer" {
  type = string
}
variable "sku" {
  type = string
}
#-------------------- IP--------------------------
variable "ipname"{
  type=string
}
variable "ip_allocation_method" {
  type = string
}