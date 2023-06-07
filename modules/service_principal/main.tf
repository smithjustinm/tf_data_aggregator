data "azuread_client_config" "current" {}

resource "azuread_application" "data_aggregator" {
  display_name = var.service_principal_name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "data_aggregator" {
  application_id               = azuread_application.data_aggregator.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "time_rotating" "seven_days" {
  rotation_days = 7
}

resource "azuread_service_principal_password" "data_aggregator" {
  service_principal_id = azuread_service_principal.data_aggregator.object_id
  rotate_when_changed = {
    rotation = time_rotating.seven_days.id
  }
}

# resource "azuread_service_principal" "data_aggregator_pgflex" {
#   application_id               = azuread_application.data_aggregator_pgflex.application_id
#   app_role_assignment_required = false
#   owners                       = [data.azuread_client_config.current.object_id]
# }

# resource "azuread_service_principal_password" "data_aggregator_pgflex_access" {
#   service_principal_id = azuread_service_principal.data_aggregator.object_id
#   rotate_when_changed = {
#     rotation = time_rotating.seven_days.id
#   }
# }