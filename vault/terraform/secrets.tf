#----------------------------------------------------------
# Enable secrets engines
#----------------------------------------------------------
resource "vault_mount" "cipher_store" {
  path        = var.cipher_path
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount for TESTAPP access ciphers"
}

resource "vault_kv_secret_v2" "ciphers_secret" {
  mount                      = vault_mount.cipher_store.path
  name                       = var.cipher_kv_name
  cas                        = 1
  delete_all_versions        = true
  data_json                  = jsonencode(
  {
    test       = "value",
  }
  )
}

# Enable Transit secrets engine at 'transit' for boundary
resource "vault_mount" "transit" {
  path = "transit"
  type = "transit"
}

# Create boundary encryption keys.
resource "vault_transit_secret_backend_key" "boundary_keys" {
  for_each         = var.transit_keynames
  depends_on       = [vault_mount.transit]
  backend          = vault_mount.transit.path
  name             = each.key
  deletion_allowed = true
}
