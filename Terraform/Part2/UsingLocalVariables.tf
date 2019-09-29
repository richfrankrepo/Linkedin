provider "azurerm" { 

     version = ">=1.28.0"

} 

locals {
  rg_name = "My-First-Terraform-RG"
  default_region = "UKSouth"
}


resource "azurerm_resource_group" "NewResourceGroup" { 

     name = local.rg_name 

     location = local.default_region 

}
