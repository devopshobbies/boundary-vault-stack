# boundary recovery key

path "transit/encrypt/recovery-boundary" {
  capabilities = ["update", "create"]
}

path "transit/decrypt/recovery-boundary" {
  capabilities = ["update", "create"]
}

# boundary-worker-auth
path "transit/encrypt/boundary-worker-auth" {
  capabilities = ["update", "create"]
}

path "transit/decrypt/boundary-worker-auth" {
  capabilities = ["update", "create"]
}

# root-boundary
path "transit/encrypt/root-boundary" {
  capabilities = ["update", "create"]
}

path "transit/decrypt/root-boundary" {
  capabilities = ["update", "create"]
}