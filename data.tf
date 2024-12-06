data "keycloak_role" "master_admin_role" {
  realm_id = "master"
  name     = "admin"
}

