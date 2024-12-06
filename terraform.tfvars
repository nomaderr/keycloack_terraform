realms = ["auth-services","nexus-sso","grafana","infra"]
master_groups = ["Admin", "Game-dev", "Java", "PO", "Support"]

auth_clients = {
  "aggregator-cn" = {
    client_id                       = "aggregator-cn"
    name                            = "Aggregator-CN"
    valid_redirect_uris             = ["https://games.provider.com/?act=auth"]
    valid_post_logout_redirect_uris = ["https://games.provider.com/"]
    root_url                        = "https://games.provider.com/"
    base_url                        = "https://games.provider.com/"
    admin_url                       = "https://games.provider.com/"
    web_origins                     = ["https://games.provider.com/"]
    login_theme                     = "keycloak"
    access_type                     = "CONFIDENTIAL"
    service_accounts                = true
    realm_id                        = "auth-services"
  }

  "aggregator-eu" = {
    client_id                       = "aggregator-eu"
    name                            = "Aggregator-EU"
    valid_redirect_uris             = ["https://games.my.games/?act=auth"]
    valid_post_logout_redirect_uris = ["https://games.my.games/"]
    root_url                        = "https://games.my.games/"
    base_url                        = "https://games.my.games/"
    admin_url                       = "https://games.my.games/"
    web_origins                     = ["https://games.my.games/"]
    login_theme                     = "keycloak"
    access_type                     = "CONFIDENTIAL"
    service_accounts                = true
    realm_id                        = "auth-services"
  }
  "aggregator-super" = {
    client_id                       = "aggregator-super"
    name                            = "Aggregator-SUPERS"
    valid_redirect_uris             = ["https://games.super.games/?act=auth"]
    valid_post_logout_redirect_uris = ["https://games.super.games/"]
    root_url                        = "https://games.super.games/"
    base_url                        = "https://games.super.games/"
    admin_url                       = "https://games.super.games/"
    web_origins                     = ["https://games.super.games/"]
    login_theme                     = "keycloak"
    access_type                     = "CONFIDENTIAL"
    service_accounts                = true
    realm_id                        = "auth-services"
  }
  "aggregator-hkg" = {
    client_id                       = "aggregator-hkg"
    name                            = "Aggregator-HKG"
    valid_redirect_uris             = ["https://games.999provider.com/?act=auth"]
    valid_post_logout_redirect_uris = ["https://games.999provider.com/"]
    root_url                        = "https://games.999provider.com/"
    base_url                        = "https://games.999provider.com/"
    admin_url                       = "https://games.999provider.com/"
    web_origins                     = ["https://games.999provider.com/"]
    login_theme                     = "keycloak"
    access_type                     = "CONFIDENTIAL"
    service_accounts                = true
    realm_id                        = "auth-services"
  }
  "aggregator-manage" = {
    client_id                       = "aggregator-manage"
    name                            = "Aggregator-MGA"
    valid_redirect_uris             = ["https://games.my-games.com/?act=auth"]
    valid_post_logout_redirect_uris = ["https://games.my-games.com/"]
    root_url                        = "https://games.my-games.com/"
    base_url                        = "https://games.my-games.com/"
    admin_url                       = "https://games.my-games.com/"
    web_origins                     = ["https://games.my-games.com/"]
    login_theme                     = "keycloak"
    access_type                     = "CONFIDENTIAL"
    service_accounts                = true
    realm_id                        = "auth-services"
  }
  "aggregator-wg" = {
    client_id                       = "aggregator-wg"
    name                            = "Aggregator-WG"
    valid_redirect_uris             = ["https://games.production.games/?act=auth"]
    valid_post_logout_redirect_uris = ["https://games.production.games/"]
    root_url                        = "https://games.production.games/"
    base_url                        = "https://games.production.games/"
    admin_url                       = "https://games.production.games/"
    web_origins                     = ["https://games.production.games/"]
    login_theme                     = "keycloak"
    access_type                     = "CONFIDENTIAL"
    service_accounts                = true
    realm_id                        = "auth-services"
  }
  "client-area" = {
    client_id                       = "client-area"
    name                            = "client-area"
    valid_redirect_uris             = ["https://client-area.my.games/*"]
    valid_post_logout_redirect_uris = ["https://client-area.my.games/*"]
    root_url                        = "https://client-area.my.games/"
    base_url                        = "https://client-area.my.games/"
    admin_url                       = "https://client-area.my.games/"
    web_origins                     = ["https://client-area.my.games"]
    login_theme                     = "client-area"
    access_type                     = "PUBLIC"
    service_accounts                = false
    realm_id                        = "auth-services"
  }
  "bo" = {
    client_id                       = "bo"
    name                            = "Evoplay Entertainment Back Office"
    valid_redirect_uris             = [
      "https://bo-new.rc.super.tech/*",
      "https://bo-new.gt.super.tech/*",
      "http://localhost:3000/*",
      "https://bo-new.sb.super.tech/*"
    ]
    valid_post_logout_redirect_uris = ["https://bo-new.sb.super.tech/"]
    root_url                        = "https://bo-new.sb.super.tech/"
    base_url                        = "https://bo-new.sb.super.tech/"
    admin_url                       = "https://bo-new.sb.super.tech/"
    web_origins                     = [
      "https://bo-new.rc.super.tech",
      "https://bo-new.gt.super.tech",
      "http://localhost:3000",
      "https://bo-new.sb.super.tech"
    ]
    login_theme                     = "keycloak"
    access_type                     = "PUBLIC"
    service_accounts                = false
    realm_id                        = "auth-services"
  }

  "bo-rtp" = {
    client_id                       = "bo-rtp"
    name                            = "BO-RTP"
    valid_redirect_uris             = ["https://rtp.my-test.net/user/auth"]
    valid_post_logout_redirect_uris = ["https://bo-rtp.my-test.net/"]
    root_url                        = "https://bo-rtp.my-test.net/"
    base_url                        = "https://bo-rtp.my-test.net/"
    admin_url                       = "https://bo-rtp.my-test.net/"
    web_origins                     = ["https://bo-rtp.my-test.net/"]
    login_theme                     = "keycloak"
    access_type                     = "CONFIDENTIAL"
    service_accounts                = true
    realm_id                        = "auth-services"
  }

  "qa-panel" = {
    client_id                       = "qa-panel"
    name                            = "QAPanel"
    valid_redirect_uris             = ["http://127.0.0.1:5000/*"]
    valid_post_logout_redirect_uris = ["http://127.0.0.1:5000/"]
    root_url                        = "http://127.0.0.1:5000/"
    base_url                        = "http://127.0.0.1:5000/"
    admin_url                       = "http://127.0.0.1:5000/"
    web_origins                     = ["*"]
    login_theme                     = "keycloak"
    access_type                     = "CONFIDENTIAL"
    service_accounts                = false
    realm_id                        = "auth-services"
  }
  "grafana" = {
    client_id                       = "grafana"
    name                            = "Grafana client"
    valid_redirect_uris             = ["https://grafana.super.tech/"]
    valid_post_logout_redirect_uris = ["https://grafana.super.tech/"]
    root_url                        = "https://grafana.super.tech/"
    base_url                        = "https://grafana.super.tech/"
    admin_url                       = ""
    web_origins                     = ["https://grafana.super.tech/"]
    login_theme                     = "keycloak"
    access_type                     = "PUBLIC"
    service_accounts                = false
    realm_id                        = "grafana"
  }

  "grafana-test" = {
    client_id                       = "grafana-test"
    name                            = "Grafana-test client"
    valid_redirect_uris             = ["https://grafana-test.super.tech/"]
    valid_post_logout_redirect_uris = ["https://grafana-test.super.tech/"]
    root_url                        = "https://grafana-test.super.tech/"
    base_url                        = "https://grafana-test.super.tech/"
    admin_url                       = ""
    web_origins                     = ["https://grafana-test.super.tech/"]
    login_theme                     = "keycloak"
    access_type                     = "PUBLIC"
    service_accounts                = false
    realm_id                        = "grafana"
  }

  "nexus-sso" = {
    client_id                       = "nexus-sso"
    name                            = "Nexus SSO Client"
    valid_redirect_uris             = ["https://nexus.my.games/callback?client_name=SAML2Client"]
    valid_post_logout_redirect_uris = ["https://nexus.my.games/logout"]
    root_url                        = "https://nexus.my.games/"
    base_url                        = "https://nexus.my.games/"
    admin_url                       = "https://nexus.my.games/admin"
    web_origins                     = ["https://nexus.my.games"]
    login_theme                     = "keycloak"
    access_type                     = "PUBLIC"
    service_accounts                = false
    realm_id                        = "nexus-sso"
  }

  "awx-saml" = {
    client_id                       = "awx-saml"
    name                            = "AWX SAML Client"
    valid_redirect_uris             = ["https://awx.super.tech/"]
    valid_post_logout_redirect_uris = ["https://awx.super.tech/logout"]
    root_url                        = "https://awx.super.tech/"
    base_url                        = "https://awx.super.tech/"
    admin_url                       = "https://awx.super.tech/admin"
    web_origins                     = ["https://awx.super.tech"]
    login_theme                     = "keycloak"
    access_type                     = "PUBLIC"
    service_accounts                = false
    realm_id                        = "infra"
  }
}