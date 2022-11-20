resource "azurerm_network_security_group" "cluster-sg" {
  name                = var.sg_name
  location            = var.resource_group["location"]
  resource_group_name = var.resource_group["name"]

  security_rule {
    name                       = "inbound-rule"
    priority                   = var.security_rule["priority"]
    direction                  = "Inbound"
    access                     = var.security_rule["access"]
    protocol                   = var.security_rule["protocol"]
    source_port_range          = var.security_rule["source_port_range"]
    destination_port_range     = var.security_rule["destination_port_range"]
    source_address_prefix      = var.security_rule["source_address_prefix"]
    destination_address_prefix = var.security_rule["destination_address_prefix"]
  }

  security_rule {
    name                       = "outbound-rule"
    priority                   = var.security_rule["priority"]
    direction                  = "Outbound"
    access                     = var.security_rule["access"]
    protocol                   = var.security_rule["protocol"]
    source_port_range          = var.security_rule["source_port_range"]
    destination_port_range     = var.security_rule["destination_port_range"]
    source_address_prefix      = var.security_rule["source_address_prefix"]
    destination_address_prefix = var.security_rule["destination_address_prefix"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags
}