# Terraform global naming

This module helps you to keep consistency on your resources names for Terraform. For each resource that requires a name you can compose it using this module, keeping naming conventions consistent across your repositories.

## Usage

```hcl
module "aws_bucket_name" {
  source = "devops-ia/naming/global"

  project     = "myproject"
  environment = "dev"
  resource    = "s3"
  description = "dummy"
}

output "aws_bucket_name" {
  value = module.aws_bucket_name.name
}

resource "aws_s3_bucket" "dummy" {
  bucket = module.aws_bucket_name.name

  ...
}
```

Outputs:

```
Changes to Outputs:
  + aws_bucket_name = "myproject-dev-s3-dummy"
```

The name is constructed by joining the non-empty parts (`prefix`, `project`, `environment`, `resource`, `location`, `description`, `suffix`) with the configured `delimiter`. Empty values are automatically omitted so there are no extraneous delimiters.

Length validation happens at **plan time** — if the resulting name exceeds `limits` (default 25), Terraform will fail with a clear error message showing the actual name and length.

## Terraform Docs

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Character used to join name parts (e.g. '-', '\_', ''). | `string` | `"-"` | no |
| <a name="input_description"></a> [description](#input\_description) | Optional description to add context to the resource name. | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name (e.g. dev, staging, prod). | `string` | n/a | yes |
| <a name="input_limits"></a> [limits](#input\_limits) | Maximum allowed character length for the constructed resource name. | `number` | `25` | no |
| <a name="input_location"></a> [location](#input\_location) | Optional location or region appended to the resource name. | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Optional prefix prepended to the resource name. | `string` | `""` | no |
| <a name="input_project"></a> [project](#input\_project) | Project name used as a component of the resource name. | `string` | n/a | yes |
| <a name="input_resource"></a> [resource](#input\_resource) | Resource type identifier (e.g. vm, s3, rg). | `string` | n/a | yes |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | Optional suffix appended at the end of the resource name. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The constructed resource name. |
| <a name="output_total_length"></a> [total\_length](#output\_total\_length) | Total character length of the constructed resource name. |

## Authors

Module is maintained by [DevOps IA](https://github.com/devops-ia) with help from [these awesome contributors](https://github.com/devops-ia/terraform-global-naming/graphs/contributors).
