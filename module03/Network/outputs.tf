output "subnet_id_output" {
  value = azurerm_subnet.sn-default.id
  description = "the ID of the created subnet"
}