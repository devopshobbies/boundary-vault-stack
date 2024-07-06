# List enabled secrets engines
path "sys/mounts"
{
  capabilities = ["read", "list"]
}

# List, create, update, and delete key/value secrets at store/
path "store/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}