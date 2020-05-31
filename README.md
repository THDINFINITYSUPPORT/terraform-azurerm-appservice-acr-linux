# terraform-azurerm-appservice-acr-linux

This Terraform module will help you create an App Service on Azure that uses an image from a Container Registry (ACR) for Linxu containers.

Terraform [AzureRM App Service](https://www.terraform.io/docs/providers/azurerm/r/app_service.html) specification.

Terraform Registry: [appservice-acr-linux](https://registry.terraform.io/modules/evandropomatti/appservice-acr-linux/azurerm)

## Usage

```terraform
module "app" {
  source  = "evandropomatti/appservice-acr-linux/azurerm"
  version = "0.3.1"
  
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

## Argument support

The following Terraform arguments are supported for now:

- [x] name
- [x] resource_group_name
- [x] location
- [x] app_service_plan_id
- [x] app_settings
- [] auth_settings
- [x] storage_account
- [] backup
- [] connection_string
- [] client_affinity_enabled
- [] client_cert_enabled
- [] enabled
- [] https_only
- [] logs
- [x] site_config
- [x] tags
- [] identity

## Testing

Testing is manual for now.