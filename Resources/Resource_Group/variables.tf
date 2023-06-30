variable "resource_group_name" {
  description = "The name of the  resource group."
  type 		  = string
}

variable "location" {
  description = "The location/region where the resource group is created."
  type 		  = string
}

variable "tags" {
  description = "A mapping of tags to all the resources."
   type       = map(string)
}
