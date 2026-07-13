output "web_app_url" {
  description = "URL della Web App creata"
  value       = module.web_app.web_app_url
}

output "resource_group_used" {
  description = "Resource Group utilizzato per il deploy"
  value       = data.azurerm_resource_group.lab.name
}
