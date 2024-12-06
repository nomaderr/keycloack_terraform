#resource "keycloak_openid_client" "this" {
#  for_each  = var.auth_clients
#  realm_id  = keycloak_realm.this["auth-services"].id
#  client_id = each.value.client_id
#  name      = each.value.name
#  enabled   = true
#
#  access_type                     = each.value.access_type
#  valid_redirect_uris             = each.value.valid_redirect_uris
#  valid_post_logout_redirect_uris = each.value.valid_post_logout_redirect_uris
#
#  root_url    = each.value.root_url
#  base_url    = each.value.base_url
#  admin_url   = each.value.admin_url
#  web_origins = each.value.web_origins
#
#  direct_access_grants_enabled = true
#  standard_flow_enabled        = true
#  implicit_flow_enabled        = false
#  service_accounts_enabled     = each.value.service_accounts
#  frontchannel_logout_enabled  = true
#
#  dynamic "authorization" {
#    for_each = {for key,value in var.auth_clients: key => value if  key == each.key && value.access_type != "PUBLIC"}
#    content {
#      policy_enforcement_mode          = "DISABLED"
#      decision_strategy                = "UNANIMOUS"
#      allow_remote_resource_management = false
#    }
#  }
#
#  login_theme = each.value.login_theme
#
#
#}
resource "keycloak_openid_client" "this" {
  for_each  = var.auth_clients
  realm_id  = each.value.realm_id
  client_id = each.value.client_id
  name      = each.value.name
  enabled   = true

  access_type                     = each.value.access_type
  valid_redirect_uris             = each.value.valid_redirect_uris
  valid_post_logout_redirect_uris = each.value.valid_post_logout_redirect_uris
  root_url                        = each.value.root_url
  base_url                        = each.value.base_url
  admin_url                       = each.value.admin_url
  web_origins                     = each.value.web_origins

  direct_access_grants_enabled = true
  standard_flow_enabled        = true
  implicit_flow_enabled        = false
  service_accounts_enabled     = each.value.service_accounts
  frontchannel_logout_enabled  = true

  login_theme = each.value.login_theme

  dynamic "authorization" {
    for_each = each.value.access_type != "PUBLIC" ? [1] : []
    content {
      policy_enforcement_mode          = "DISABLED"
      decision_strategy                = "UNANIMOUS"
      allow_remote_resource_management = false
    }
  }
}
