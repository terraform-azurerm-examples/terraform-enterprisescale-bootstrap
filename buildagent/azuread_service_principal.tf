resource "time_offset" "spn_end_date" {
  offset_years = 2
}

resource "random_password" "spn_password" {
  length  = 24
  special = true
}

resource "azuread_application" "estf" {
  display_name               = "estf"
  homepage                   = "http://estf"
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
}

resource "azuread_service_principal" "estf" {
  application_id               = azuread_application.estf.application_id
  app_role_assignment_required = false
}

resource "azuread_service_principal_password" "estf" {
  service_principal_id = azuread_service_principal.estf.id
  description          = "SPN-password"
  value                = random_password.spn_password.result
  end_date             = time_offset.spn_end_date.rfc3339
}
