resource "null_resource" "validate_variables" {
  count = (local.total_length < var.limits) ? 0 : 1
  provisioner "local-exec" {
    command = "echo ${local.validation_error_message} && exit 1"
  }
}
