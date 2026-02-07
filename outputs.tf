output "name" {
  description = "The constructed resource name."
  value       = local.resource_name

  precondition {
    condition     = length(local.resource_name) <= var.limits
    error_message = "Resource name '${local.resource_name}' is ${length(local.resource_name)} characters, exceeding the limit of ${var.limits}."
  }
}

output "total_length" {
  description = "Total character length of the constructed resource name."
  value       = length(local.resource_name)
}
