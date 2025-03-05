<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.50.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>4.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>4.7.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | tfe-dev.guidehouse.com/guidehouse-terra-dev/seas-lib/azure//modules/storage | 1.13.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ARM_CLIENT_ID"></a> [ARM\_CLIENT\_ID](#input\_ARM\_CLIENT\_ID) | scoped Service Principal creds read-only access to subscription resources contribute access to specific resource group | `any` | n/a | yes |
| <a name="input_ARM_CLIENT_SECRET"></a> [ARM\_CLIENT\_SECRET](#input\_ARM\_CLIENT\_SECRET) | n/a | `any` | n/a | yes |
| <a name="input_ARM_SUBSCRIPTION_ID"></a> [ARM\_SUBSCRIPTION\_ID](#input\_ARM\_SUBSCRIPTION\_ID) | ------------------------------------------------------------ Common Module variables ------------------------------------------------------------ move the following to terraform cloud | `any` | n/a | yes |
| <a name="input_ARM_TENANT_ID"></a> [ARM\_TENANT\_ID](#input\_ARM\_TENANT\_ID) | n/a | `any` | n/a | yes |
| <a name="input_blob_inventory_rules"></a> [blob\_inventory\_rules](#input\_blob\_inventory\_rules) | scope for the blob inventory policy | <pre>object({<br>    scope         = string,<br>    schedule      = string,<br>    output_format = string,<br>    schema_fields = list(string)<br>    filter_rules = object({<br>      blob_types = list(string)<br>    })<br>  })</pre> | <pre>{<br>  "filter_rules": {<br>    "blob_types": [<br>      "blockBlob",<br>      "appendBlob"<br>    ]<br>  },<br>  "output_format": "Csv",<br>  "schedule": "Weekly",<br>  "schema_fields": [<br>    "Name",<br>    "Content-Length",<br>    "Content-Type"<br>  ],<br>  "scope": "Blob"<br>}</pre> | no |
| <a name="input_enable_blob_inventory_policy"></a> [enable\_blob\_inventory\_policy](#input\_enable\_blob\_inventory\_policy) | Enable blob inventory policy | `bool` | `false` | no |
| <a name="input_enable_cors_rule_storage_blob_properties"></a> [enable\_cors\_rule\_storage\_blob\_properties](#input\_enable\_cors\_rule\_storage\_blob\_properties) | Set value to true to set blob cors rules. | `bool` | `false` | no |
| <a name="input_enable_storage_account"></a> [enable\_storage\_account](#input\_enable\_storage\_account) | Enable storage account creation | `bool` | `false` | no |
| <a name="input_enable_storage_blob"></a> [enable\_storage\_blob](#input\_enable\_storage\_blob) | (Required if using blob containers) Enable storage blob creation | `bool` | `false` | no |
| <a name="input_enable_storage_blob_properties"></a> [enable\_storage\_blob\_properties](#input\_enable\_storage\_blob\_properties) | Set value to true to set policies for blob retention, restoration and deletion. | `bool` | `false` | no |
| <a name="input_enable_storage_container"></a> [enable\_storage\_container](#input\_enable\_storage\_container) | Enable storage container creation | `bool` | `false` | no |
| <a name="input_enable_storage_identity"></a> [enable\_storage\_identity](#input\_enable\_storage\_identity) | Set True to enable the storage identity | `bool` | `false` | no |
| <a name="input_enable_storage_network_rules"></a> [enable\_storage\_network\_rules](#input\_enable\_storage\_network\_rules) | Enable storage network rules | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the storage account should be created | `string` | `"EastUs2"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the storage account should be created | `string` | n/a | yes |
| <a name="input_storage_account_cmk_enable"></a> [storage\_account\_cmk\_enable](#input\_storage\_account\_cmk\_enable) | Enable storage account cmk | `bool` | `false` | no |
| <a name="input_storage_account_cmk_key_name"></a> [storage\_account\_cmk\_key\_name](#input\_storage\_account\_cmk\_key\_name) | The name of the Key where the Key Encryption Key (CMK) resides. | `string` | `""` | no |
| <a name="input_storage_account_cmk_keyvault_id"></a> [storage\_account\_cmk\_keyvault\_id](#input\_storage\_account\_cmk\_keyvault\_id) | The ID of the Key Vault where the Key Encryption Key (CMK) resides. | `string` | `""` | no |
| <a name="input_storage_account_data_lake_hsn_enabled"></a> [storage\_account\_data\_lake\_hsn\_enabled](#input\_storage\_account\_data\_lake\_hsn\_enabled) | Enable Hierarchical Namespace for the Data Lake Gen2 Storage Account ensure ( Storage Account Replication Kind set to: LSR \| Storage Account tier: Standard \| Storage Account Kind: StorageV2) | `bool` | `false` | no |
| <a name="input_storage_account_kind"></a> [storage\_account\_kind](#input\_storage\_account\_kind) | Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2 | `string` | `"StorageV2"` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group. | `string` | `"uszu3deptxxxxxxenv"` | no |
| <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier) | Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created. | `string` | `"Standard"` | no |
| <a name="input_storage_blob_map"></a> [storage\_blob\_map](#input\_storage\_blob\_map) | Map for the ability to create multiple blobs - ensure your blob matches the container map sequencial order | <pre>map(object({<br>    name                   = string<br>    storage_container_name = string<br>    type                   = string<br>  }))</pre> | <pre>{<br>  "blob1": {<br>    "name": "blob1",<br>    "storage_container_name": "container1",<br>    "type": "private"<br>  }<br>}</pre> | no |
| <a name="input_storage_blob_properties_config"></a> [storage\_blob\_properties\_config](#input\_storage\_blob\_properties\_config) | Map for the ability to create multiple containers | <pre>map(object({<br>    delete_retention_policy_days           = number<br>    restore_policy_days                    = number<br>    container_delete_retention_policy_days = number<br>    versioning_enabled                     = bool<br>    change_feed_enabled                    = bool<br>    cors_rules_allowed_headers             = list(string)<br>    cors_rules_allowed_methods             = list(string)<br>    cors_rules_allowed_origins             = list(string)<br>    cors_rules_exposed_headers             = list(string)<br>    cors_rules_max_age_in_seconds          = number<br>  }))</pre> | <pre>{<br>  "blob-policy1": {<br>    "change_feed_enabled": false,<br>    "container_delete_retention_policy_days": 14,<br>    "cors_rules_allowed_headers": [<br>      "*"<br>    ],<br>    "cors_rules_allowed_methods": [<br>      "GET"<br>    ],<br>    "cors_rules_allowed_origins": [<br>      "*"<br>    ],<br>    "cors_rules_exposed_headers": [<br>      "*"<br>    ],<br>    "cors_rules_max_age_in_seconds": 3600,<br>    "delete_retention_policy_days": 14,<br>    "restore_policy_days": 7,<br>    "versioning_enabled": false<br>  }<br>}</pre> | no |
| <a name="input_storage_container_map"></a> [storage\_container\_map](#input\_storage\_container\_map) | Map for the ability to create multiple containers | <pre>map(object({<br>    name                  = string<br>    container_access_type = string<br>  }))</pre> | <pre>{<br>  "container1": {<br>    "container_access_type": "private",<br>    "name": "container1"<br>  }<br>}</pre> | no |
| <a name="input_storage_file_name"></a> [storage\_file\_name](#input\_storage\_file\_name) | The name of the share. Must be unique within the storage account where the share is located. Changing this forces a new resource to be created. | `string` | `"uszu3-xxxxxx-env"` | no |
| <a name="input_storage_file_quota"></a> [storage\_file\_quota](#input\_storage\_file\_quota) | The maximum size of the share, in gigabytes. Must be greater than 0, and less than or equal to 5TB (5120). Changing this forces a new resource to be created. | `number` | `50` | no |
| <a name="input_storage_identity_ids"></a> [storage\_identity\_ids](#input\_storage\_identity\_ids) | Specifies a list of User Assigned Managed Identity IDs to be assigned to this Storage. | `list(string)` | `[]` | no |
| <a name="input_storage_identity_type"></a> [storage\_identity\_type](#input\_storage\_identity\_type) | Specifies the type of Managed Service Identity that should be configured on this Storage. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both). | `string` | `"SystemAssigned"` | no |
| <a name="input_storage_network_rules"></a> [storage\_network\_rules](#input\_storage\_network\_rules) | Map of storage network rules | <pre>map(object({<br>    default_action = string<br>    bypass         = list(string)<br>    ip_rules       = list(string)<br>  }))</pre> | <pre>{<br>  "network_rule1": {<br>    "bypass": [<br>      "AzureServices"<br>    ],<br>    "default_action": "Deny",<br>    "ip_rules": [<br>      ""<br>    ]<br>  }<br>}</pre> | no |
| <a name="input_storage_public_network_access_enabled"></a> [storage\_public\_network\_access\_enabled](#input\_storage\_public\_network\_access\_enabled) | Whether the public network access is enabled? Defaults to true. | `bool` | `false` | no |
| <a name="input_storage_queues_metadata"></a> [storage\_queues\_metadata](#input\_storage\_queues\_metadata) | List of storage queues with their metadata | <pre>list(object({<br>    name     = string<br>    metadata = map(string)<br>  }))</pre> | `[]` | no |
| <a name="input_storage_replication_type"></a> [storage\_replication\_type](#input\_storage\_replication\_type) | Storage account replication type - i.e. LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS. | `string` | `"GRS"` | no |
| <a name="input_storage_share_enable"></a> [storage\_share\_enable](#input\_storage\_share\_enable) | Enable storage share creation | `bool` | `false` | no |
| <a name="input_storage_user_assigned_identity_id"></a> [storage\_user\_assigned\_identity\_id](#input\_storage\_user\_assigned\_identity\_id) | (Optional) The ID of a user assigned identity. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->