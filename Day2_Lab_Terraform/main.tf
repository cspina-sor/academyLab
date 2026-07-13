module "web_app" {
  source = "./modules/web-app"

  student_name        = var.student_name
  resource_group_name = data.azurerm_resource_group.lab.name
  location            = data.azurerm_resource_group.lab.location
  sku_name            = var.sku_name
  tags                = var.tags
}
