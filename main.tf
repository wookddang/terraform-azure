terraform {
  required_version = "~> 1.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.9.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "2.3.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

# 리소스 그룹 생성
resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}-${var.environment}-${random_string.suffix.result}"
  location = var.location
  tags = {
    Environment = var.environment
  }
}

# 서비스 플랜 생성
resource "azurerm_service_plan" "plan" {
  name                = "${var.service_plan_name}-${var.environment}-${random_string.suffix.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "S1"
  os_type             = "Linux"
}

# 웹 앱 여러 개 생성
resource "azurerm_linux_web_app" "app" {
  count               = var.webapp_count
  name                = "${var.app_name}-${var.environment}-${random_string.suffix.result}-${count.index + 1}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {}
}
