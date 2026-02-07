locals {
  resource_parts = compact([
    var.prefix,
    var.project,
    var.environment,
    var.resource,
    var.location,
    var.description,
    var.suffix,
  ])

  resource_name = join(var.delimiter, local.resource_parts)
}
