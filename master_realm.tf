resource "keycloak_group" "master" {
  for_each = {
    "Admin"     = "Admin",
    "Game-dev"  = "Game-dev",
    "Java"      = "Java",
    "PO"        = "PO",
    "Support"   = "Support"
  }
  realm_id = "master"
  name     = each.value
}

resource "keycloak_group_roles" "master_admin_group_roles" {
  realm_id = "master"
  group_id = keycloak_group.master["Admin"].id

  role_ids = [
    data.keycloak_role.master_admin_role.id
  ]
}


resource "keycloak_saml_identity_provider" "realm_saml_idp_master" {
  realm        = "master"
  alias        = "google-sso"
  display_name = "Google"

  entity_id = format("%s/realms/%s", "https://auth.super.tech", "master")

  single_sign_on_service_url = "https://accounts.google.com/o/saml2/idp?idpid=xxxxx"

  name_id_policy_format = "Email"
  principal_attribute   = "USERNAME"
  principal_type        = "ATTRIBUTE"
  sync_mode             = "IMPORT"

  backchannel_supported      = false
  post_binding_response      = true
  post_binding_logout        = true
  post_binding_authn_request = true
  store_token                = false
  trust_email                = true
  force_authn                = false
  extra_config               = {}
}

resource "keycloak_custom_identity_provider_mapper" "master_admin" {
  realm                    = "master"
  name                     = "Admin Mapper"
  identity_provider_alias  = keycloak_saml_identity_provider.realm_saml_idp_master.alias
  identity_provider_mapper = "saml-advanced-group-idp-mapper"

  extra_config = {
    syncMode   = "IMPORT"
    group      = "Admin"
    attributes = "[{\"key\":\"Groups\",\"value\":\"DevOps\"}]"
  }
}


