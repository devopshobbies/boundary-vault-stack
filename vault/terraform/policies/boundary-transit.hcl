# boundary recovery key

path "transit/encrypt/recovery-boundary" {
  capabilities = ["update", "create", "read"]
}

path "transit/decrypt/recovery-boundary" {
  capabilities = ["update", "create", "read"]
}

# boundary-worker-auth
path "transit/encrypt/worker-auth-boundary" {
  capabilities = ["update", "create", "read"]
}

path "transit/decrypt/worker-auth-boundary" {
  capabilities = ["update", "create", "read"]
}

# root-boundary
path "transit/encrypt/root-boundary" {
  capabilities = ["update", "create", "read"]
}

path "transit/decrypt/root-boundary" {
  capabilities = ["update", "create", "read"]
}