variable "name" {
  description = "The name of the App Service. If you change the name of the App Service."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group."
  type        = string
}

variable "location" {
  description = "The Location name where this resource. It must be in the same locatiion as the ACR."
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan within which to create this App Service."
  type        = string
}

variable "startup_command" {
  description = "The command to be executed to start your application."
  type        = string
  default     = ""
}

variable "acr_image" {
  description = "The complete name of the image in the Azure Container Services, e.g. <registry>.azurecr.io/<image>:<tag>"
  type        = string
}

variable "always_on" {
  description = "Tells the service to be always on, or turn-off when has no load. Default is false."
  type        = bool
  default     = false
}

variable "enable_continuous_integration" {
  description = "Updates the container when a new image is published. Default is true."
  type        = bool
  default     = true
}

variable "enable_app_service_storage" {
  description = "Enable app service storage. Default is false."
  type        = bool
  default     = false
}

variable "acr_url" {
  description = "The URL of the Container Registry server. Should be https://<registry>.azurerc.io"
  type        = string
}

variable "acr_username" {
  description = "The username of the Container Registry server."
  type        = string
}

variable "acr_password" {
  description = "The password of the Container Registry server."
  type        = string
}

variable "storage_account" {
  description = "A storage account to be added to the App Service. Values match the deafult from Terraform documentation."
  type        = object({
    name         = string
    type         = string
    account_name = string
    share_name   = string
    access_key   = string
    mount_path   = string
  })
  default = {}
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
  default = { }
}