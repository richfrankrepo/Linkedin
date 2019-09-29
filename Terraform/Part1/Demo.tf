provider "azurerm" { 

     version = ">=1.28.0"

} 



resource "azurerm_resource_group" "NewResourceGroup" { 

     name = "My-First-Terraform-RG" 

     location = "UKSouth" 

}
