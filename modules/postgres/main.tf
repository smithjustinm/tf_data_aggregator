resource "azurerm_postgresql_flexible_server" "data_aggregator_server" {
  name                   = "data_aggregator"
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = "12"
  administrator_login    = 
  administrator_password = ""
  storage_mb             = 32768
  sku_name               = "GP_Standard_D4s_v3"
}

resource "azurerm_postgresql_flexible_server_database" "pgflex_db" {
  name      = "data_aggregator_db"
  server_id = azurerm_postgresql_flexible_server.data_aggregator_db.id
  collation = "en_US.utf8"
  charset   = "utf8"
}