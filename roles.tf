resource "keycloak_role" "admin_auth_services" {
  realm_id = "auth-services"
  name     = "admin"
  description = "Admin role in auth-services"
}

resource "keycloak_role" "qa_auth_services" {
  realm_id = "auth-services"
  name     = "qa"
  description = "QA role in auth-services"
}

resource "keycloak_role" "super_auth_services" {
  realm_id = "auth-services"
  name     = "super"
  description = "Super role in auth-services"
}

resource "keycloak_role" "admin_grafana" {
  realm_id = "grafana"
  name     = "admin"
  description = "Admin role in grafana"
}

resource "keycloak_role" "developers_grafana" {
  realm_id = "grafana"
  name     = "developers"
  description = "Developers role in grafana"
}

resource "keycloak_role" "test_role_grafana" {
  realm_id = "grafana"
  name     = "test-role"
  description = "Test role in grafana"
}

resource "keycloak_role" "developers_nexus" {
  realm_id = "nexus-sso"
  name     = "developers"
  description = "Developers role in nexus-sso"
}

resource "keycloak_role" "admin_nexus" {
  realm_id = "nexus-sso"
  name     = "admin"
  description = "Admin role in nexus-sso"
}

resource "keycloak_role" "devops_infra" {
  realm_id = "infra"
  name     = "DevOps"
  description = "DevOps role in infra"
}
