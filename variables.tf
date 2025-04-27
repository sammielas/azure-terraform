# variables.tf
variable "environment" {
  description = "The deployment environment (dev, stage, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "stage", "prod"], lower(var.environment))
    error_message = "Environment must be one of: dev, stage, prod"
  }
}

variable "location" {
  description = "The Azure region to deploy to"
  type        = string
  default     = "eastus"
  validation {
    condition     = contains(["eastus", "westeurope", "southeastasia"], lower(var.location))
    error_message = "Region must be one of: eastus, westeurope, southeastasia"
  }
}

variable "resource_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "webapp"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "app_subnet_prefix" {
  description = "Address prefix for application subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "mgmt_subnet_prefix" {
  description = "Address prefix for management subnet"
  type        = string
  default     = "10.0.2.0/24"
}