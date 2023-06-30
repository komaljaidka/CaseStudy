variable "name" {
  description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the network security group. Changing this forces a new resource to be created."
  type        = string
}
variable "security_rule" {
  description = "Security Rule"
  type =  list(object({
      name                        = string
      description                 = string
      priority                    = number
      direction                   = string
      access                      = string
      protocol                    = string
      source_port_range           = string
      destination_port_range      = string
      source_address_prefix       = string
      destination_address_prefix  = string
      source_address_prefixes                     = list(string)
      source_port_ranges                          = list(string)
      source_application_security_group_ids       = list(string)
      destination_address_prefixes                = list(string)
      destination_port_ranges                     = list(string)
      destination_application_security_group_ids  = list(string)

    }))
}