#--------------------------------
# Enable userpass auth method
#--------------------------------

resource "vault_auth_backend" "userpass" {
  type = "userpass"
  path = var.userpass_path
}

# Create Admin users
resource "vault_generic_endpoint" "admins" {
  for_each             = var.login_creds
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/${var.userpass_path}/users/${each.key}"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["admins"],
  "password": "${each.value}"
}
EOT
}

# Create transit admins 
# resource "vault_generic_endpoint" "transit-admins" {
#   for_each             = var.transit_admins
#   depends_on           = [vault_auth_backend.userpass]
#   path                 = "auth/${var.userpass_path}/users/${each.key}"
#   ignore_absent_fields = true

#   data_json = <<EOT
# {
#   "policies": ["transit-admin"],
#   "password": "${each.value}"
# }
# EOT
# }
