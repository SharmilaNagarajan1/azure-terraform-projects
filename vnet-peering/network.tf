data "azurerm_resource_group" "rg" {
  name = " " 
}
variable "vnet-names"{
    default = ["vnet1", "vnet2"]
}
resource "azurerm_virtual_network" "vnet" {
  count = length(var.vnet-names)
  name = var.vnet-names[count.index]
  resource_group_name = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location
  address_space = [ "10.${count.index}.0.0/16" ]
}

resource "azurerm_subnet" "subnet" {
  count = length(var.vnet-names)
  name = "subnet-${count.index+1}"
  resource_group_name = data.azurerm_resource_group.rg.name  
  virtual_network_name = azurerm_virtual_network.vnet[count.index].name
  address_prefixes = [ "10.${count.index}.0.0/24" ]
}


resource "azurerm_virtual_network_peering" "peering1" {
  name = "peer1to2"  
  resource_group_name = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet[0].name
  remote_virtual_network_id = azurerm_virtual_network.vnet[1].id
}

resource "azurerm_virtual_network_peering" "peering2" {
  name = "peer2to1"  
  resource_group_name = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet[1].name
  remote_virtual_network_id = azurerm_virtual_network.vnet[0].id
}

