data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

locals {
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  tags                = data.azurerm_resource_group.this.tags
}

module "storage_account" {
  source  = "tfe-dev.guidehouse.com/guidehouse-terra-dev/seas-lib/azure//modules/storage"
  version = "1.13.0"

  resource_group_name = local.resource_group_name
  location            = local.location
  tags                = local.tag

  enable_storage_account = var.enable_storage_account
  storage_account_name   = var.storage_account_name
  storage_account_tier   = var.storage_account_tier
  storage_account_kind   = var.storage_account_kind

  storage_replication_type              = var.storage_replication_type
  storage_public_network_access_enabled = var.storage_public_network_access_enabled
  storage_account_data_lake_hsn_enabled = var.storage_account_data_lake_hsn_enabled

  enable_storage_identity = var.enable_storage_identity
  storage_identity_type   = var.storage_identity_type
  storage_identity_ids    = var.storage_identity_ids

  enable_storage_blob_properties           = var.enable_storage_blob_properties
  enable_cors_rule_storage_blob_properties = var.enable_cors_rule_storage_blob_properties
  storage_blob_properties_config           = var.storage_blob_properties_config

  enable_storage_network_rules = var.enable_storage_network_rules
  storage_network_rules        = var.storage_network_rules

  enable_storage_container = var.enable_storage_container
  storage_container_map    = var.storage_container_map

  enable_storage_blob = var.enable_storage_blob
  storage_blob_map    = var.storage_blob_map

  storage_share_enable = var.storage_share_enable
  storage_file_name    = var.storage_file_name
  storage_file_quota   = var.storage_file_quota

  storage_account_cmk_enable        = var.storage_account_cmk_enable
  storage_account_cmk_keyvault_id   = var.storage_account_cmk_keyvault_id
  storage_account_cmk_key_name      = var.storage_account_cmk_key_name
  storage_user_assigned_identity_id = var.storage_user_assigned_identity_id

  enable_blob_inventory_policy = var.enable_blob_inventory_policy
  blob_inventory_rules         = var.blob_inventory_rules

  storage_queues_metadata = var.storage_queues_metadata
}