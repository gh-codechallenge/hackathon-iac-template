#------------------------------------------------------------
# Common Module variables
#------------------------------------------------------------

ARM_SUBSCRIPTION_ID = "your_subscription_id"
ARM_CLIENT_ID       = "your_client_id"
ARM_CLIENT_SECRET   = "your_client_secret"
ARM_TENANT_ID       = "your_tenant_id"
resource_group_name = "your_resource_group_name"

#------------------------
# Storage account vars
#------------------------

enable_storage_account                = false
storage_account_name                  = "uszu3deptxxxxxxenv"
storage_account_tier                  = "Standard"
storage_account_kind                  = "StorageV2"
storage_replication_type              = "GRS"
storage_public_network_access_enabled = false
storage_account_data_lake_hsn_enabled = false

# Identity setup
enable_storage_identity = false
storage_identity_type   = "SystemAssigned"
storage_identity_ids    = []

# Blob properties variables
enable_storage_blob_properties           = false
enable_cors_rule_storage_blob_properties = false
storage_blob_properties_config = {
  "blob-policy1" = {
    delete_retention_policy_days           = 14
    restore_policy_days                    = 7
    container_delete_retention_policy_days = 14
    versioning_enabled                     = false
    change_feed_enabled                    = false
    cors_rules_allowed_headers             = ["*"]
    cors_rules_allowed_methods             = ["GET"]
    cors_rules_allowed_origins             = ["*"]
    cors_rules_exposed_headers             = ["*"]
    cors_rules_max_age_in_seconds          = 3600
  }
}

# Network rules variables
enable_storage_network_rules = false
storage_network_rules = {
  network_rule1 = {
    default_action = "Deny"
    bypass         = ["AzureServices"]
    ip_rules       = [""]
  }
}

# Storage container variables
enable_storage_container = false
storage_container_map = {
  container1 = {
    name                  = "container1"
    container_access_type = "private"
  }
}

# Storage blob variables
enable_storage_blob = false
storage_blob_map = {
  blob1 = {
    name                   = "blob1"
    storage_container_name = "container1"
    type                   = "private"
  }
}

# Storage share variables
storage_share_enable = false
storage_file_name    = "uszu3-xxxxxx-env"
storage_file_quota   = 50

# Storage account CMK
storage_account_cmk_enable        = false
storage_account_cmk_keyvault_id   = ""
storage_account_cmk_key_name      = ""
storage_user_assigned_identity_id = null

# Blob inventory policy variables
enable_blob_inventory_policy = false
blob_inventory_rules = {
  scope         = "Blob"
  schedule      = "Weekly"
  output_format = "Csv"
  schema_fields = ["Name", "Content-Length", "Content-Type"]
  filter_rules = {
    blob_types = ["blockBlob", "appendBlob"]
  }
}

# Storage queues metadata
storage_queues_metadata = []