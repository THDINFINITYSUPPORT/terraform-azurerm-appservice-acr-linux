output "app_service_id" {
  description = "The id of the newly created App Service"
  value       = azurerm_app_service.app.id
}