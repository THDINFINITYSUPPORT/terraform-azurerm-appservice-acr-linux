# terraform-azurerm-appservice-acr-linux

This Terraform module will help you create an App Service on Azure that uses an image from a Container Registry (ACR) for Linxu containers.

## Usage

```terraform
module "app" {
  source  = "evandropomatti/appservice-acr-linux/azurerm"
  version = "0.2.4"
  
  name                = "app"
  location            = "southbrazil"
  resource_group_name = "my-resources"
  app_service_plan_id = azurerm_app_service_plan.default.id

  startup_command = "startup.sh"
  acr_image       = "contoso.azurecr.io/app:latest"
  acr_url         = "https://contosoregistry.azurecr.io" 
  acr_username    = "contosoregistry"
  acr_password    = var.CONTAINER_REGISTRY_PASSWORD
  
  always_on       = true

  tags = {
      environment = "dev"
  }
}

```

## Testing

Testing is manual for now.