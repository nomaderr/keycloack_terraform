variable "realms" {
  type    = set(string)
  default = ["auth-services", "nexus-sso", "grafana", "infra"]
}

variable "master_groups" {
  type    = set(string)
  default = ["Admin", "Game-dev", "Java", "PO", "Support"]
}

variable "auth_clients" {
  type = map(object({
    client_id                       = string
    name                            = string
    valid_redirect_uris             = set(string)
    valid_post_logout_redirect_uris = set(string)
    root_url                        = string
    base_url                        = string
    admin_url                       = string
    web_origins                     = set(string)
    login_theme                     = string
    access_type                     = string
    service_accounts                = bool
    realm_id                        = string
  }))
  default = {}
}

#variable "auth_groups" {
#  type = set(string)
#  default = [
#    "Aggregators-ADMINs",
#    "Aggregators-QAs",
#    "Aggregators-SUPERs",
#    "Default Group",
#    "Employee",
#    "Integrations",
#    "QA",
#    "Support",
#    "Tech Leads"
#  ]
#}
variable "auth_groups" {
  type = map(object({
    realm_id = string
    name     = string
  }))
  default = {
    "Aggregators-ADMINs" = { realm_id = "auth-services", name = "Aggregators-ADMINs" }
    "Aggregators-QAs"    = { realm_id = "auth-services", name = "Aggregators-QAs" }
    "Aggregators-SUPERs" = { realm_id = "auth-services", name = "Aggregators-SUPERs" }
    "Default Group"      = { realm_id = "auth-services", name = "Default Group" }
    "Employee"           = { realm_id = "auth-services", name = "Employee" }
    "Integrations"       = { realm_id = "auth-services", name = "Integrations" }
    "QA"                 = { realm_id = "auth-services", name = "QA" }
    "Support"            = { realm_id = "auth-services", name = "Support" }
    "Tech Leads"         = { realm_id = "auth-services", name = "Tech Leads" }
  }
}

variable "nexus_groups" {
  type = map(object({
    realm_id = string
    name     = string
  }))
  default = {
    "admin"      = { realm_id = "nexus-sso", name = "admin" }
    "developers" = { realm_id = "nexus-sso", name = "developers" }
    "test"       = { realm_id = "nexus-sso", name = "test" }
  }
}

variable "grafana_groups" {
  type = map(object({
    realm_id = string
    name     = string
  }))
  default = {
    "admin"      = { realm_id = "grafana", name = "admin" }
    "developers" = { realm_id = "grafana", name = "developers" }
  }
}

variable "infra_groups" {
  type = map(object({
    realm_id = string
    name     = string
  }))
  default = {
    "DevOps" = { realm_id = "infra", name = "DevOps" }
  }
}

variable "role_definitions" {
  type = map(list(object({
    realm_id    = string
    client_id   = string
    name        = string
    description = string
  })))
  default = {
    "auth-services" = [
      { realm_id = "auth-services", client_id = "", name = "admin", description = "Admin role" },
      { realm_id = "auth-services", client_id = "", name = "qa", description = "QA role" },
      { realm_id = "auth-services", client_id = "", name = "super", description = "Super role" }
    ]
    "nexus-sso" = [
      { realm_id = "nexus-sso", client_id = "", name = "developers", description = "Developers role" },
      { realm_id = "nexus-sso", client_id = "", name = "helm-system", description = "Helm System role" },
      { realm_id = "nexus-sso", client_id = "", name = "nx-admin", description = "NX Admin role" },
      { realm_id = "nexus-sso", client_id = "", name = "nx-anonymous", description = "NX Anonymous role" },
      { realm_id = "nexus-sso", client_id = "", name = "nx-developers", description = "NX Developers role" },
      { realm_id = "nexus-sso", client_id = "", name = "offline_access", description = "Offline Access role" }
    ]
    "grafana" = [
      { realm_id = "grafana", client_id = "grafana", name = "admin", description = "Admin role" },
      { realm_id = "grafana", client_id = "grafana", name = "developers", description = "Developers role" },
      { realm_id = "grafana", client_id = "grafana", name = "test-role", description = "Test role" },
      { realm_id = "grafana", client_id = "grafana-test", name = "admin", description = "Admin role" },
      { realm_id = "grafana", client_id = "grafana-test", name = "developers", description = "Developers role" },
      { realm_id = "grafana", client_id = "grafana-test", name = "test-role", description = "Test role" }
    ]
    "infra" = [
      { realm_id = "infra", client_id = "", name = "DevOps", description = "DevOps role" },
      { realm_id = "infra", client_id = "", name = "admin", description = "Admin role" }
    ]
  }
}