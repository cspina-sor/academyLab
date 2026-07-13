locals {
  plan_name = "asp-${var.student_name}"
  app_name  = "app-${var.student_name}-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_service_plan" "plan" {
  name                = local.plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.sku_name
  tags                = var.tags
}

resource "azurerm_linux_web_app" "app" {
  name                = local.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.plan.id
  tags                = var.tags

  site_config {
    always_on = false
  }
}
