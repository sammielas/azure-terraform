# terraform.tfvars
environment      = "dev"
location         = "eastus"
resource_prefix  = "webapp"
vnet_address_space = ["10.0.0.0/16"]
app_subnet_prefix  = "10.0.1.0/24"
mgmt_subnet_prefix = "10.0.2.0/24"