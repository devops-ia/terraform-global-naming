variable "prefix" {
  description = "Optional prefix prepended to the resource name."
  type        = string
  default     = ""
  nullable    = false
}

variable "project" {
  description = "Project name used as a component of the resource name."
  type        = string
  nullable    = false

  validation {
    condition     = length(var.project) > 0
    error_message = "The project must not be empty."
  }
}

variable "environment" {
  description = "Environment name (e.g. dev, staging, prod)."
  type        = string
  nullable    = false

  validation {
    condition     = length(var.environment) > 0
    error_message = "The environment must not be empty."
  }
}

variable "resource" {
  description = "Resource type identifier (e.g. vm, s3, rg)."
  type        = string
  nullable    = false

  validation {
    condition     = length(var.resource) > 0
    error_message = "The resource must not be empty."
  }
}

variable "location" {
  description = "Optional location or region appended to the resource name."
  type        = string
  default     = ""
  nullable    = false
}

variable "description" {
  description = "Optional description to add context to the resource name."
  type        = string
  default     = ""
  nullable    = false
}

variable "suffix" {
  description = "Optional suffix appended at the end of the resource name."
  type        = string
  default     = ""
  nullable    = false
}

variable "delimiter" {
  description = "Character used to join name parts (e.g. '-', '_', '')."
  type        = string
  default     = "-"
  nullable    = false
}

variable "limits" {
  description = "Maximum allowed character length for the constructed resource name."
  type        = number
  default     = 25
  nullable    = false

  validation {
    condition     = var.limits > 0
    error_message = "The limits must be greater than 0."
  }
}
