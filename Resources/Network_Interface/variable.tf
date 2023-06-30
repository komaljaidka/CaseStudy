variable "name" {
  type = string
  description = "NIC name"
}
variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "ipname" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "private_ip_address_allocation" {
  type = string
}