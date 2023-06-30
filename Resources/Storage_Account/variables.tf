variable "name" {
  description = "description of storage account parameters"
  type        = string
}
variable "location" {
  description = "description of storage account parameters"
  type        = string
}
variable "resource_group_name" {
  description = "description of storage account parameters"
  type        = string
}
variable "account_tier" {
  description = "description of storage account parameters"
  type        = string
}
variable "account_replication_type" {
  description = "description of storage account parameters"
  type        = string
}
variable "account_kind" {
  description = "description of storage account parameters"
  type        = string
}
variable "min_tls_version" {
  description = "description of storage account parameters"
  type        = string
}
variable "public_network_access_enabled" {
  description = "description of storage account parameters"
  type        = bool
}
variable "allow_nested_items_to_be_public" {
  description = "description of storage account parameters"
  type        = bool
}
variable "enable_https_traffic_only" {
  description = "description of storage account parameters"
  type        = bool
}
variable "access_tier" {
  description = "description of storage account parameters"
  type        = string
}
variable "default_action" {
  description = "description of storage account parameters"
  type        = string
}
variable "ip_rules" {
  description = "description of storage account parameters"
  type        = list(string)
}
variable "virtual_network_subnet_ids" {
  description = "description of storage account parameters"
  type        = list(string)
}
variable "type" {
  description = "description of storage account parameters"
  type        = string
}
