provider "azurerm" {
    version = "2.5.0"
    features {}
}

resource "azurerm_resource_group" "tf_r_g" {
    name = "TerraGroup"
    location = "West Europe"
}

resource "azurerm_container_group" "tf_c_g" {
    name = "Shoppingkubeacr"
    location = azurerm_resource_group.tf_r_g.location
    resource_group_name = azurerm_resource_group.tf_r_g.name
    
    ip_address_type = "public"
    dns_name_label = "shoppingdns"
    os_type = "linux"

    container {
        name = "shoppingapi"
        image = "senjespakk/shoppingapi:336"
        cpu = "1"
        memory = "1"
        ports {
            port = 80
            protocol = "TCP"
        }
    }
}