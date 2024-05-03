data "azuread_group" "sqlADGroup" {
  display_name     = var.ad_group_admin_login_name
  security_enabled = true
}