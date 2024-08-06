locals {
  # Create a list of resource name parts, excluding any null or empty values
  resource_parts = compact([
    var.prefix,
    var.project,
    var.environment,
    var.resource,
    var.location,
    var.description,
    var.suffix
  ])

  # Join the non-null resource name parts with the specified delimiter
  resource_name = join(var.delimiter, local.resource_parts)

  # Calculate the length of each variable, handling null values appropriately
  prefix_length      = length(var.prefix != null ? var.prefix : "")
  project_length     = length(var.project)
  environment_length = length(var.environment)
  resource_length    = length(var.resource)
  location_length    = length(var.location != null ? var.location : "")
  description_length = length(var.description != null ? var.description : "")
  suffix_length      = length(var.suffix != null ? var.suffix : "")
  delimiter_length   = length(var.delimiter)

  # Calculate the total length of all the components
  total_length = sum([
    local.prefix_length,
    local.project_length,
    local.environment_length,
    local.resource_length,
    local.location_length,
    local.description_length,
    local.suffix_length,
    local.delimiter_length
  ])

  # Define a validation error message to use if the total length exceeds the specified limit
  validation_error_message = "The total length of all variables must be less than var.limits. Actual value: ${var.limits}."
}
