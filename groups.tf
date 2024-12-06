resource "keycloak_group" "auth_services" {
  for_each = {
    "Aggregators-ADMINs" = "Aggregators-ADMINs"
    "Aggregators-QAs" = "Aggregators-QAs"
    "Aggregators-SUPERs" = "Aggregators-SUPERs"
  }
  realm_id = "auth-services"
  name     = each.value
}

resource "keycloak_group_roles" "admin_groups_roles" {
  realm_id = "auth-services"
  group_id = keycloak_group.auth_services["Aggregators-ADMINs"].id
  role_ids = [keycloak_role.admin_auth_services.id]
}

resource "keycloak_group_roles" "qa_groups_roles" {
  realm_id = "auth-services"
  group_id = keycloak_group.auth_services["Aggregators-QAs"].id
  role_ids = [keycloak_role.qa_auth_services.id]
}

resource "keycloak_group_roles" "super_groups_roles" {
  realm_id = "auth-services"
  group_id = keycloak_group.auth_services["Aggregators-SUPERs"].id
  role_ids = [keycloak_role.super_auth_services.id]
}

resource "keycloak_group" "grafana_groups" {
  for_each = {
    "admin" = "admin"
    "developers" = "developers"
  }
  realm_id = "grafana"
  name     = each.value
}

resource "keycloak_group_roles" "grafana_group_roles" {
  for_each = {
    "admin" = keycloak_role.admin_grafana.id
    "developers" = keycloak_role.developers_grafana.id
  }
  realm_id = "grafana"
  group_id = keycloak_group.grafana_groups[each.key].id
  role_ids = [each.value]
}

resource "keycloak_group" "nexus_groups" {
  for_each = {
    "admin" = "admin"
    "developers" = "developers"
  }
  realm_id = "nexus-sso"
  name     = each.value
}

resource "keycloak_group_roles" "nexus_group_roles" {
  for_each = {
    "admin" = keycloak_role.admin_nexus.id
    "developers" = keycloak_role.developers_nexus.id
  }
  realm_id = "nexus-sso"
  group_id = keycloak_group.nexus_groups[each.key].id
  role_ids = [each.value]
}

resource "keycloak_group" "infra_groups" {
  for_each = {
    "DevOps" = "DevOps"
  }
  realm_id = "infra"
  name     = each.value
}

resource "keycloak_group_roles" "infra_group_roles" {
  realm_id = "infra"
  group_id = keycloak_group.infra_groups["DevOps"].id
  role_ids = [keycloak_role.devops_infra.id]
}
