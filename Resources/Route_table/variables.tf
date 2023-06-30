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
variable "disable_bgp_route_propagation" {
  description = "(Required) The name of the resource group in which to create the network security group. Changing this forces a new resource to be created."
  type        = bool
}
variable "route" {
  description = "route"
  type =  list(object({
    name           = string
    address_prefix = string
    next_hop_type  = string

    }))
}