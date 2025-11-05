output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "Created Resource Group name"
}

output "service_plan_name" {
  value       = azurerm_service_plan.plan.name
  description = "Created Service Plan name"
}

output "webapp_names" {
  value       = [for app in azurerm_linux_web_app.app : app.name]
  description = "List of created Web App names"
}
