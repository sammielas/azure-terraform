# locals.tf
locals {
  common_tags = {
    Environment = var.environment
    Project     = "WebApp"
    ManagedBy   = "Terraform"
  }

  resource_name = "${var.resource_prefix}-${var.environment}"

  vm_size = {
    dev   = "Standard_B1s"
    stage = "Standard_B2s"
    prod  = "Standard_B2ms"
  }
}