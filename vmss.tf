# vmss.tf
locals {
  vm_size = {
    dev   = "Standard_B1s"
    stage = "Standard_B2s"
    prod  = "Standard_B2ms"
  }
}

resource "azurerm_orchestrated_virtual_machine_scale_set" "main" {
  name                        = "${var.resource_prefix}-${var.environment}-vmss"
  resource_group_name         = azurerm_resource_group.main.name
  location                    = azurerm_resource_group.main.location
  sku_name                    = local.vm_size[var.environment]
  instances                   = 2
  platform_fault_domain_count = 1

  
   os_profile {
    linux_configuration {
      disable_password_authentication = true
      admin_username                  = "azureuser"
      admin_ssh_key {
        username   = "azureuser"
        public_key = file("~/.ssh/id_rsa.pub")
      }
    }

    custom_data = base64encode(file("user-data.sh"))
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-LTS-gen2"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name                          = "${var.resource_prefix}-${var.environment}-nic"
    primary                       = true
    enable_accelerated_networking = false

    ip_configuration {
      name                                   = "internal"
      primary                                = true
      subnet_id                              = azurerm_subnet.app.id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.main.id]
    }
  }

  lifecycle {
    ignore_changes = [instances]
  }
}