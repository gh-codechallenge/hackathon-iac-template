#------------------------------------------------------------
# Common Module variables
#------------------------------------------------------------
// move the following to terraform cloud
variable "ARM_SUBSCRIPTION_ID" {
  sensitive = true
}
//scoped Service Principal creds
//read-only access to subscription resources
//contribute access to specific resource group
variable "ARM_CLIENT_ID" {
}
variable "ARM_CLIENT_SECRET" {
  sensitive = true
}
variable "ARM_TENANT_ID" {}
variable "region" {
  description = "The region where the storage account should be created"
  type        = string
  default     = "EastUs2"
}
variable "resource_group_name" {
  description = "The name of the resource group in which the storage account should be created"
  type        = string
}