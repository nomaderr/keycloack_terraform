resource "keycloak_realm" "this" {
#  for_each     = var.realms
  for_each = toset(var.realms)
  realm        = each.value
  enabled      = true
  display_name = each.value

  reset_password_allowed = true

  smtp_server {
    host              = "email-smtp.eu-central-1.amazonaws.com"
    from              = "no-reply@smtp.super.tech"
    from_display_name = "Auth System"
    port              = "587"


    auth {
      username = "xxx"
      password = "xxxx"
    }
  }

  security_defenses {
    headers {
      x_frame_options                     = "DENY"
      content_security_policy             = "frame-src 'self'; frame-ancestors 'self'; object-src 'none';"
      content_security_policy_report_only = ""
      x_content_type_options              = "nosniff"
      x_robots_tag                        = "none"
      x_xss_protection                    = "1; mode=block"
      strict_transport_security           = "max-age=31536000; includeSubDomains"
    }
    brute_force_detection {
      permanent_lockout                = false
      max_login_failures               = 30
      wait_increment_seconds           = 60
      quick_login_check_milli_seconds  = 1000
      minimum_quick_login_wait_seconds = 60
      max_failure_wait_seconds         = 900
      failure_reset_time_seconds       = 43200
    }
  }
}
