output "name" {
  description = "This output provides the generated resource name based on the specified variables. The name is constructed by concatenating the provided prefix, project, environment, resource type, location, description, and suffix with the specified delimiter. Empty or null values are omitted, ensuring that there are no extraneous delimiters in the resulting name. This output can be used to reference the constructed resource name in other parts of your Terraform configuration or in other dependent modules."
  value       = local.resource_name
}
