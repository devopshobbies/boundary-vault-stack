provider "boundary" {
  addr = var.boundary_address
  # auth_method_id         = var.auth_method_id
  # auth_method_login_name = var.login_name
  # auth_method_password   = var.login_password

  ## Address is the VAULT SERVER ADDRESS
  recovery_kms_hcl = <<EOT
kms "transit" {
  purpose            = "recovery"
  address            = "${var.vault_address}"
  disable_renewal    = "false"
  // Key configuration
  key_name           = "recovery-boundary"
  mount_path         = "transit/"
  tls_skip_verify    = "true"
  vault_prefix        = "transit/"
}
EOT
}