module "random_name" {
  source = "../../../terraform-global-naming/"

  prefix      = "ste"
  project     = "aso"
  environment = "env"
  resource    = "random"
  location    = ""
  description = "security"
  suffix      = ""
  delimiter   = "-"
  limits      = 25
}

resource "null_resource" "cluster" {
  provisioner "local-exec" {
    command = "echo ${module.random_name.name}"
  }
}
