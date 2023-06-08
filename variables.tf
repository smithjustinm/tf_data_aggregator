variable "resource_group_name" {
  type        = string
  description = "Azure Resource Group Name"
  default     = "justin-interview-wus2-rg"
}

variable "azure_location" {
  type        = string
  description = "Azure Location"
  default     = "West US 2"
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
}