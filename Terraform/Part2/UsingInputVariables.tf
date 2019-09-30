variable "rg_name" {
     type = string
     description = "Enter the name of the resource group you wish to create (e.g. RG-Using-Input-Variables)"
}

variable "az_region" {
     type = string
     default = "UKSouth" 
}


resource "azurerm_resource_group" "ResourceGroupByInputVariable" { 

     name = var.rg_name

     location = var.az_region 

}
