variable "prefix" {
  description = "[Optional] Fixed prefix. This is an optional prefix that can be added at the beginning of the generated name. It's useful for categorizing or grouping resources under a common prefix. For example, if you have multiple projects, you can use 'dev', 'test', or 'prod' as prefixes to easily distinguish between different environments."
  type        = string
  nullable    = true
  default     = ""
}

variable "project" {
  description = "[Mandatory] Project Name. This is the name of the project for which the resources are being created. It is a mandatory field and is used to identify and organize resources within a specific project. The project name should be concise and descriptive, reflecting the purpose or scope of the project."
  type        = string
  nullable    = false
}

variable "environment" {
  description = "[Mandatory] Environment. This specifies the environment in which the resources will be deployed. Common values include 'dev' for development, 'test' for testing, 'staging' for pre-production, and 'prod' for production. Defining the environment helps in managing and segregating resources based on their deployment stage."
  type        = string
  nullable    = false
}

variable "resource" {
  description = "[Mandatory] Resource. This indicates the specific type of resource being managed, such as 'vm' for virtual machines, 'storage' for storage accounts, or 'network' for network components. This field is crucial for identifying the resource type and ensuring that naming conventions are consistently applied across different resource categories."
  type        = string
  nullable    = false
}

variable "location" {
  description = "[Optional] Location. This is an optional field that specifies the geographical location or region where the resource will be deployed. Examples include 'us-east1', 'europe-west1', or 'asia-southeast1'. Including the location in the name can help in managing resources distributed across multiple regions."
  type        = string
  nullable    = true
  default     = ""
}

variable "description" {
  description = "[Optional] Description. This optional field provides additional context or details about the resource. It can include information such as the purpose of the resource, its intended use, or any specific configurations. Adding a description can help in better understanding and managing resources, especially in complex environments."
  type        = string
  nullable    = true
  default     = ""
}

variable "suffix" {
  description = "[Optional] Purpose. This optional suffix can be used to further specify the purpose or role of the resource. For example, you might use 'db' for database servers, 'web' for web servers, or 'cache' for caching servers. Using a suffix helps in quickly identifying the function of a resource within its environment."
  type        = string
  nullable    = true
  default     = ""
}

variable "delimiter" {
  description = "[Mandatory] Define your delimiter. This mandatory field specifies the character used to separate different parts of the resource name. Common delimiters include '-', '_', or ''. The delimiter helps in creating readable and structured names by clearly separating components such as prefix, project, environment, and resource type."
  type        = string
  nullable    = false
  default     = "-"
}

variable "limits" {
  description = "[Mandatory] Define your characters limits. This mandatory field sets the maximum allowed length for the combined resource name. This limit ensures that the resource names comply with any length restrictions imposed by the platform or service being used. The total length includes all components such as prefix, project, environment, resource type, location, description, suffix, and delimiter."
  type        = number
  nullable    = false
  default     = 25
}
