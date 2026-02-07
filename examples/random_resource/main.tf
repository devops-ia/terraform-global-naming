module "random_name" {
  source = "../../"

  prefix      = "ste"
  project     = "aso"
  environment = "env"
  resource    = "random"
  description = "security"
}

resource "null_resource" "cluster" {
  provisioner "local-exec" {
    command = "echo ${module.random_name.name}"
  }
}
