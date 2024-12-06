resource "keycloak_saml_identity_provider" "auth-services" {
  realm        = "auth-services"
  alias        = "google-sso"
  display_name = "Google"

  entity_id = format("%s/realms/%s", "https://keycloack.super.tech", "auth-services")

  single_sign_on_service_url = "https://accounts.google.com/o/saml2/idp?idpid=xxxxxxxxxx"

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

resource "keycloak_custom_identity_provider_mapper" "admin" {
  realm                    = "auth-services"
  name                     = "Admin Mapper"
  identity_provider_alias  = keycloak_saml_identity_provider.auth-services.alias
  identity_provider_mapper = "saml-advanced-group-idp-mapper"

  extra_config = {
    syncMode   = "IMPORT"
    group      = "Admin"
    attributes = "[{\"key\":\"Groups\",\"value\":\"DevOps\"}]"
  }
}

resource "keycloak_custom_identity_provider_mapper" "qa" {
  realm                    = "auth-services"
  name                     = "QA Mapper"
  identity_provider_alias  = keycloak_saml_identity_provider.auth-services.alias
  identity_provider_mapper = "saml-advanced-group-idp-mapper"

  extra_config = {
    syncMode   = "IMPORT"
    group      = "Qa"
    attributes = "[{\"key\":\"Groups\",\"value\":\"QA\"}]"
  }
}

resource "keycloak_custom_identity_provider_mapper" "qa-super" {
  realm                    = "auth-services"
  name                     = "QA Super Mapper"
  identity_provider_alias  = keycloak_saml_identity_provider.auth-services.alias
  identity_provider_mapper = "saml-advanced-group-idp-mapper"

  extra_config = {
    syncMode   = "IMPORT"
    group      = "Super"
    attributes = "[{\"key\":\"Groups\",\"value\":\"QA\"}]"
  }
}


resource "keycloak_custom_identity_provider_mapper" "support" {
  realm                    = "auth-services"
  name                     = "Support Super Mapper"
  identity_provider_alias  = keycloak_saml_identity_provider.auth-services.alias
  identity_provider_mapper = "saml-advanced-group-idp-mapper"

  extra_config = {
    syncMode   = "IMPORT"
    group      = "Super"
    attributes = "[{\"key\":\"Groups\",\"value\":\"Support\"}]"
  }
}

resource "keycloak_custom_identity_provider_mapper" "my-dev" {
  realm                    = "auth-services"
  name                     = "MY DEV Super Mapper"
  identity_provider_alias  = keycloak_saml_identity_provider.auth-services.alias
  identity_provider_mapper = "saml-advanced-group-idp-mapper"

  extra_config = {
    syncMode   = "IMPORT"
    group      = "Super"
    attributes = "[{\"key\":\"Groups\",\"value\":\"MY-Dev\"}]"
  }
}

resource "keycloak_custom_identity_provider_mapper" "game-dev" {
  realm                    = "auth-services"
  name                     = "Game Dev Mapper"
  identity_provider_alias  = keycloak_saml_identity_provider.auth-services.alias
  identity_provider_mapper = "saml-advanced-group-idp-mapper"

  extra_config = {
    syncMode   = "IMPORT"
    group      = "Admin"
    attributes = "[{\"key\":\"Groups\",\"value\":\"MY-Game-Dev\"}]"
  }
}

resource "keycloak_custom_identity_provider_mapper" "all" {
  realm                    = "auth-services"
  name                     = "All Super Mapper"
  identity_provider_alias  = keycloak_saml_identity_provider.auth-services.alias
  identity_provider_mapper = "saml-advanced-group-idp-mapper"

  extra_config = {
    syncMode   = "IMPORT"
    group      = "Super"
    attributes = "[{\"key\":\"Groups\",\"value\":\"all\"}]"
  }
}
