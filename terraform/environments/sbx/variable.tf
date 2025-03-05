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
#------------------------
# Storage account vars
#------------------------
variable "enable_storage_account" {
  description = "Enable storage account creation"
  type        = bool
  default     = false
}

variable "storage_account_name" {
  description = "Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
  type        = string
  default     = "uszu3deptxxxxxxenv"
}

variable "storage_account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard"
}

variable "storage_account_kind" {
  description = "Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2"
  type        = string
  default     = "StorageV2"
}

variable "storage_replication_type" {
  description = "Storage account replication type - i.e. LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS."
  type        = string
  default     = "GRS"
}

variable "storage_public_network_access_enabled" {
  description = " Whether the public network access is enabled? Defaults to true."
  type        = bool
  default     = false
}

variable "storage_account_data_lake_hsn_enabled" {
  description = "Enable Hierarchical Namespace for the Data Lake Gen2 Storage Account ensure ( Storage Account Replication Kind set to: LSR | Storage Account tier: Standard | Storage Account Kind: StorageV2) "
  type        = bool
  default     = false
}

#  identity setup
variable "enable_storage_identity" {
  type        = bool
  description = "Set True to enable the storage identity"
  default     = false
}

variable "storage_identity_type" {
  type        = string
  description = "Specifies the type of Managed Service Identity that should be configured on this Storage. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both)."
  default     = "SystemAssigned"
}

#If using the `storage_identity_type` 'UserAssigned' or 'UserAssigned, SystemAssigned', need to provide the `storage_identity_ids`
variable "storage_identity_ids" {
  type        = list(string)
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Storage."
  default     = []
}

# blob properties variables
variable "enable_storage_blob_properties" {
  type        = bool
  description = "Set value to true to set policies for blob retention, restoration and deletion."
  default     = false
}
variable "enable_cors_rule_storage_blob_properties" {
  type        = bool
  description = "Set value to true to set blob cors rules."
  default     = false
}

variable "storage_blob_properties_config" {
  type = map(object({
    delete_retention_policy_days           = number
    restore_policy_days                    = number
    container_delete_retention_policy_days = number
    versioning_enabled                     = bool
    change_feed_enabled                    = bool
    cors_rules_allowed_headers             = list(string)
    cors_rules_allowed_methods             = list(string)
    cors_rules_allowed_origins             = list(string)
    cors_rules_exposed_headers             = list(string)
    cors_rules_max_age_in_seconds          = number
  }))
  description = "Map for the ability to create multiple containers"
  default = {
    "blob-policy1" = {
      delete_retention_policy_days           = 14 # must be min 14 days for non prod env(DEV&QA)and must be min 28 days for prod env (UAT&Prod)
      restore_policy_days                    = 7
      container_delete_retention_policy_days = 14 # must be min 14 days for non prod env(DEV&QA)and must be min 28 days for prod env (UAT&Prod)
      versioning_enabled                     = false
      change_feed_enabled                    = false
      cors_rules_allowed_headers             = ["*"]
      cors_rules_allowed_methods             = ["GET"]
      cors_rules_allowed_origins             = ["*"]
      cors_rules_exposed_headers             = ["*"]
      cors_rules_max_age_in_seconds          = 3600
    }
  }
}

# network rules variables
variable "enable_storage_network_rules" {
  type        = bool
  description = "Enable storage network rules"
  default     = false
}

variable "storage_network_rules" {
  type = map(object({
    default_action = string
    bypass         = list(string)
    ip_rules       = list(string)
  }))
  description = "Map of storage network rules"
  default = {
    network_rule1 = {
      default_action = "Deny"
      bypass         = ["AzureServices"]
      ip_rules       = [""]
    }
  }
}

# storage container variables
variable "enable_storage_container" {
  description = "Enable storage container creation"
  type        = bool
  default     = false
}

variable "storage_container_map" {
  type = map(object({
    name                  = string
    container_access_type = string
  }))
  description = "Map for the ability to create multiple containers"
  default = {
    container1 = {
      name                  = "container1"
      container_access_type = "private"
    }
  }
}

# storage blob variables
# conatainer needs to e created for the blob to be created
variable "enable_storage_blob" {
  description = "(Required if using blob containers) Enable storage blob creation"
  type        = bool
  default     = false
}

variable "storage_blob_map" {
  type = map(object({
    name                   = string
    storage_container_name = string
    type                   = string
  }))
  description = "Map for the ability to create multiple blobs - ensure your blob matches the container map sequencial order"
  default = {
    blob1 = {
      name                   = "blob1"
      storage_container_name = "container1"
      type                   = "private"
    }
  }
}

# storage share variables
variable "storage_share_enable" {
  type        = bool
  description = "Enable storage share creation"
  default     = false
}

variable "storage_file_name" {
  type        = string
  description = "The name of the share. Must be unique within the storage account where the share is located. Changing this forces a new resource to be created."
  default     = "uszu3-xxxxxx-env"
}

variable "storage_file_quota" {
  type        = number
  description = "The maximum size of the share, in gigabytes. Must be greater than 0, and less than or equal to 5TB (5120). Changing this forces a new resource to be created."
  default     = 50
}

# storage account cmk
variable "storage_account_cmk_enable" {
  description = "Enable storage account cmk"
  type        = bool
  default     = false
}

variable "storage_account_cmk_keyvault_id" {
  description = "The ID of the Key Vault where the Key Encryption Key (CMK) resides."
  type        = string
  default     = ""
}

variable "storage_account_cmk_key_name" {
  description = "The name of the Key where the Key Encryption Key (CMK) resides."
  type        = string
  default     = ""
}

variable "storage_user_assigned_identity_id" {
  description = "(Optional) The ID of a user assigned identity."
  type        = string
  default     = null
}

# blob inventory policy variables
variable "enable_blob_inventory_policy" {
  description = "Enable blob inventory policy"
  type        = bool
  default     = false
}

variable "blob_inventory_rules" {
  description = "scope for the blob inventory policy"
  type = object({
    scope         = string,
    schedule      = string,
    output_format = string,
    schema_fields = list(string)
    filter_rules = object({
      blob_types = list(string)
    })
  })
  default = {
    scope         = "Blob",
    schedule      = "Weekly",
    output_format = "Csv",
    schema_fields = ["Name", "Content-Length", "Content-Type"],
    filter_rules = {
      blob_types = ["blockBlob", "appendBlob"],
    }
  }

  // scope validation
  validation {
    condition     = contains(["Container", "Blob"], var.blob_inventory_rules.scope)
    error_message = "Scope must be one of Container or Blob."
  }
  // schedule validation
  validation {
    condition     = contains(["Daily", "Weekly"], var.blob_inventory_rules.schedule)
    error_message = "Schedule must be one of Daily or Weekly."
  }
  // output format validation
  validation {
    condition     = contains(["Csv", "Parquet"], var.blob_inventory_rules.output_format)
    error_message = "Format must be one of Csv or Parquet."
  }
  // schema fields validation length
  validation {
    condition     = length(var.blob_inventory_rules.schema_fields) > 0
    error_message = "Schema_fields must contain at least one field."
  }
  // schema fields validation for blob level inventory policy
  validation {
    condition = ((var.blob_inventory_rules.scope == "Blob" && alltrue([for fld in var.blob_inventory_rules.schema_fields : contains(["Name", "Creation-Time", "Last-Accessed",
      "Last-Modified", "Content-Length",
      "Content-MD5", "BlobType", "AccessTier",
      "AccessTierChangeTime", "Snapshot",
      "VersionId", "IsCurrentVersion", "Content-Type",
      "ContentEncoding", "ContentLanguage", "ContentCRC64",
      "CacheControl", "Metadata", "DeletionId", "Deleted",
      "DeletedTime", "RemainingRetentionDays"], fld)])) ||
      (var.blob_inventory_rules.scope == "Container" && alltrue([for fld in var.blob_inventory_rules.schema_fields : contains(["Name", "Last-Modified", "Last-Accessed", "Metadata",
        "LeaseStatus", "LeaseState", "LeaseDuration",
        "PublicAccess", "HasImmutabilityPolicy", "HasLegalHold",
        "Etag", "DefaultEncryptionScope", "DenyEncryptionScopeOverride",
        "ImmutableStorageWithVersioningEnabled", "Deleted", "Version",
    "DeletedTime", "RemainingRetentionDays"], fld)])))


    error_message = "Invalid schema_fields for inventory policy."
  }

  // filter_rules.blob_types validation
  validation {
    condition     = (var.blob_inventory_rules.scope == "Blob" && alltrue([for bt in var.blob_inventory_rules.filter_rules.blob_types : contains(["blockBlob", "appendBlob"], bt)]) && contains(var.blob_inventory_rules.filter_rules.blob_types, "pageBlob") == false) || (var.blob_inventory_rules.scope == "Container" && length(var.blob_inventory_rules.filter_rules.blob_types) > 0 && alltrue([for bt in var.blob_inventory_rules.filter_rules.blob_types : contains(["blockBlob", "appendBlob", "pageBlob"], bt)]))
    error_message = "If rule_scope == 'Container' blob_types must be one or more of the following: blockBlob, appendBlob, pageBlob (if rule_scope is Blob then only 'blockBlob' and 'appendBlob' are supported)."
  }

}
variable "storage_queues_metadata" {
  description = "List of storage queues with their metadata"
  type = list(object({
    name     = string
    metadata = map(string)
  }))
  default = []
}