# Terraform global naming

This module helps you to keep consistency on your resources names for Terraform The goal of this module it is that for each resource that requires a name in Terraform you would be easily able to compose this name using this module and this will keep the consistency in your repositories.

## Usage

```hcl
module "aws_bucket_name" {
  source = "devops-ia/naming/global"
  version = "1.0.0"

  prefix      = ""
  project     = "myproject"
  environment = "dev"
  resource    = "s3"
  location    = ""
  description = "dummy"
  suffix      = ""
  delimiter   = "-"
  limits      = 25
}

output "aws_bucket_name" {
  value = module.naming.name
}

resource "aws_s3_bucket" "dummy" {
  bucket = module.naming.name

  ...
}
```

Outputs:
```
Changes to Outputs:
  + aws_bucket_name = {
      + name = "myproject-dev-s3-dummy"
    }
```

## Terraform Docs

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | >= 3.2.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.validate_variables](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | [Mandatory] Define your delimiter. This mandatory field specifies the character used to separate different parts of the resource name. Common delimiters include '-', '\_', or ''. The delimiter helps in creating readable and structured names by clearly separating components such as prefix, project, environment, and resource type. | `string` | `"-"` | no |
| <a name="input_description"></a> [description](#input\_description) | [Optional] Description. This optional field provides additional context or details about the resource. It can include information such as the purpose of the resource, its intended use, or any specific configurations. Adding a description can help in better understanding and managing resources, especially in complex environments. | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | [Mandatory] Environment. This specifies the environment in which the resources will be deployed. Common values include 'dev' for development, 'test' for testing, 'staging' for pre-production, and 'prod' for production. Defining the environment helps in managing and segregating resources based on their deployment stage. | `string` | n/a | yes |
| <a name="input_limits"></a> [limits](#input\_limits) | [Mandatory] Define your characters limits. This mandatory field sets the maximum allowed length for the combined resource name. This limit ensures that the resource names comply with any length restrictions imposed by the platform or service being used. The total length includes all components such as prefix, project, environment, resource type, location, description, suffix, and delimiter. | `number` | `25` | no |
| <a name="input_location"></a> [location](#input\_location) | [Optional] Location. This is an optional field that specifies the geographical location or region where the resource will be deployed. Examples include 'us-east1', 'europe-west1', or 'asia-southeast1'. Including the location in the name can help in managing resources distributed across multiple regions. | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | [Optional] Fixed prefix. This is an optional prefix that can be added at the beginning of the generated name. It's useful for categorizing or grouping resources under a common prefix. For example, if you have multiple projects, you can use 'dev', 'test', or 'prod' as prefixes to easily distinguish between different environments. | `string` | `""` | no |
| <a name="input_project"></a> [project](#input\_project) | [Mandatory] Project Name. This is the name of the project for which the resources are being created. It is a mandatory field and is used to identify and organize resources within a specific project. The project name should be concise and descriptive, reflecting the purpose or scope of the project. | `string` | n/a | yes |
| <a name="input_resource"></a> [resource](#input\_resource) | [Mandatory] Resource. This indicates the specific type of resource being managed, such as 'vm' for virtual machines, 'storage' for storage accounts, or 'network' for network components. This field is crucial for identifying the resource type and ensuring that naming conventions are consistently applied across different resource categories. | `string` | n/a | yes |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | [Optional] Purpose. This optional suffix can be used to further specify the purpose or role of the resource. For example, you might use 'db' for database servers, 'web' for web servers, or 'cache' for caching servers. Using a suffix helps in quickly identifying the function of a resource within its environment. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="name"></a> [name](#name) | This output provides the generated resource name based on the specified variables. The name is constructed by concatenating the provided prefix, project, environment, resource type, location, description, and suffix with the specified delimiter. Empty or null values are omitted, ensuring that there are no extraneous delimiters in the resulting name. This output can be used to reference the constructed resource name in other parts of your Terraform configuration or in other dependent modules. |

## Authors

Module is maintained by [DevOps IA](https://github.com/devops-ia) with help from [these awesome contributors](https://github.com/devops-ia/terraform-global-naming/graphs/contributors).
