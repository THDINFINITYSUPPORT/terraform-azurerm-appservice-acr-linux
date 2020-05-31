resource "azurerm_app_service" "app" {
    name                = var.name
    location            = var.location
    resource_group_name = var.resource_group_name
    app_service_plan_id = var.app_service_plan_id
  
    site_config {
      app_command_line  = var.startup_command
      linux_fx_version  = "DOCKER|${var.acr_image}"
      always_on         = var.always_on
    }
  
    app_settings = {
      "DOCKER_ENABLE_CI" = var.enable_continuous_integration
      "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = var.enable_app_service_storage
      "DOCKER_REGISTRY_SERVER_PASSWORD"     = var.acr_password
      "DOCKER_REGISTRY_SERVER_URL"          = var.acr_url
      "DOCKER_REGISTRY_SERVER_USERNAME"     = var.acr_username
    }  
  
    lifecycle {
      ignore_changes = [
        site_config.0.linux_fx_version, # deployments are made outside of Terraform
      ]
    }
  
    tags = var.tags
  }