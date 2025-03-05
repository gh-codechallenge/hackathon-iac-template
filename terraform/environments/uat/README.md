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

No modules.

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
| <a name="input_region"></a> [region](#input\_region) | The region where the storage account should be created | `string` | `"EastUs2"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the storage account should be created | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->