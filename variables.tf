variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group prefix name"
  default     = "RG-App"
}

variable "service_plan_name" {
  type        = string
  description = "Service plan prefix name"
  default     = "Plan-App"
}

variable "app_name" {
  type        = string
  description = "App Service name prefix"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "environment" {
  type        = string
  description = "Environment name (e.g., DEV, QA, PROD)"
}

variable "webapp_count" {
  type        = number
  description = "Number of Web Apps to create"
}
