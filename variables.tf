# variable "subscription_id" {
#   description = ""
# }

# variable "tenant_id" {
#   description = ""
# }

# variable "client_id" {
#   description = ""
# }

# variable "client_secret" {
#   description = ""
# }

variable "cluster_name" {
  description = ""
}

variable "dns_prefix" {
  description = ""
}

# Refer to https://azure.microsoft.com/global-infrastructure/services/?products=monitor for available Log Analytics regions.
variable "log_analytics_workspace" {
  description = ""
}

variable "resource_group" {
  description = ""
}

variable "ssh_public_key" {
  description = ""
}

variable "byte_length" {
  description = ""
}

variable "tags" {
  description = ""
}

variable "default_node_pool" {
  description = ""
}

variable "admin_username" {
  description = ""
}

variable "network_profile" {
  description = ""
}

variable "service_principal" {
  description = ""
}