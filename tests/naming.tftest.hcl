run "mandatory_fields_only" {
  command = plan

  variables {
    project     = "myproject"
    environment = "dev"
    resource    = "s3"
  }

  assert {
    condition     = output.name == "myproject-dev-s3"
    error_message = "Expected 'myproject-dev-s3', got '${output.name}'"
  }

  assert {
    condition     = output.total_length == 16
    error_message = "Expected length 16, got ${output.total_length}"
  }
}

run "all_parts" {
  command = plan

  variables {
    prefix      = "pre"
    project     = "proj"
    environment = "dev"
    resource    = "vm"
    location    = "euw1"
    description = "web"
    suffix      = "001"
    limits      = 30
  }

  assert {
    condition     = output.name == "pre-proj-dev-vm-euw1-web-001"
    error_message = "Expected 'pre-proj-dev-vm-euw1-web-001', got '${output.name}'"
  }
}

run "custom_delimiter" {
  command = plan

  variables {
    project     = "myproject"
    environment = "dev"
    resource    = "s3"
    delimiter   = "_"
  }

  assert {
    condition     = output.name == "myproject_dev_s3"
    error_message = "Expected 'myproject_dev_s3', got '${output.name}'"
  }
}

run "empty_delimiter" {
  command = plan

  variables {
    project     = "myproject"
    environment = "dev"
    resource    = "s3"
    delimiter   = ""
    limits      = 25
  }

  assert {
    condition     = output.name == "myprojectdevs3"
    error_message = "Expected 'myprojectdevs3', got '${output.name}'"
  }
}

run "empty_optional_fields_are_skipped" {
  command = plan

  variables {
    prefix      = ""
    project     = "proj"
    environment = "dev"
    resource    = "rg"
    location    = ""
    description = ""
    suffix      = ""
  }

  assert {
    condition     = output.name == "proj-dev-rg"
    error_message = "Expected 'proj-dev-rg', got '${output.name}'"
  }
}

run "length_within_limits" {
  command = plan

  variables {
    project     = "proj"
    environment = "dev"
    resource    = "s3"
    limits      = 12
  }

  assert {
    condition     = output.name == "proj-dev-s3"
    error_message = "Expected 'proj-dev-s3', got '${output.name}'"
  }
}

run "length_exceeds_limits" {
  command         = plan
  expect_failures = [output.name]

  variables {
    project     = "myproject"
    environment = "development"
    resource    = "storage"
    limits      = 10
  }
}

run "invalid_limits_zero" {
  command         = plan
  expect_failures = [var.limits]

  variables {
    project     = "proj"
    environment = "dev"
    resource    = "s3"
    limits      = 0
  }
}

run "invalid_empty_project" {
  command         = plan
  expect_failures = [var.project]

  variables {
    project     = ""
    environment = "dev"
    resource    = "s3"
  }
}

run "invalid_empty_environment" {
  command         = plan
  expect_failures = [var.environment]

  variables {
    project     = "proj"
    environment = ""
    resource    = "s3"
  }
}

run "invalid_empty_resource" {
  command         = plan
  expect_failures = [var.resource]

  variables {
    project     = "proj"
    environment = "dev"
    resource    = ""
  }
}
