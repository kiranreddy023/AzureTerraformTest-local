terraform {
  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.10.0"
    }

  }
  required_version = "~>1.1.0"
}

provider "azurerm" {
  client_id                  = var.client_id
  client_secret              = var.client_secret
  subscription_id            = var.subscription_id
  tenant_id                  = var.tenant_id
  skip_provider_registration = true
  features {}
}

variable "tenant_id" {
  description = "(Required) Service Principal AD Tenant ID - Azure AD for terraform authentication."
  type        = string
}

variable "subscription_id" {
  description = "(Required) Azure Subscription Id used to connect to AzureRM provider."
  type        = string
}

variable "client_id" {
  description = "(Required) Service Principal App ID - Azure AD for terraform authentication."
  type        = string
}

variable "client_secret" {
  description = "(Required) Service Principal Client Secret - Azure AD for terraform authentication."
  type        = string
}

locals {

  containers_list = [
    { name = "blob-1", access_type = "private" },
    { name = "blob-2", access_type = "blob" },
    { name = "blob-3", access_type = "container" }
  ]

  file_shares = [
    { name = "data1", quota = 50 },
    { name = "data2", quota = 50 }
  ]

  sa_name = "mystorageaccount"
}

resource "azurerm_storage_container" "storage_container" {
  for_each              = { for container in local.containers_list : container.name => container }
  storage_account_name  = local.sa_name
  name                  = each.value.name
  container_access_type = each.value.access_type
}

resource "azurerm_storage_share" "storage_share" {
  for_each             = { for shares in local.file_shares : shares.name => shares }
  storage_account_name = local.sa_name
  name                 = each.value.name
  quota                = each.value.quota
}

output "storage_container_names" {
  value = [
    for k, v in azurerm_storage_container.storage_container : v.name
  ]
}

output "storage_share_names" {
  value = [
    for k, v in azurerm_storage_share.storage_share : v.name
  ]
}
