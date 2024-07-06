# Manage the transit secrets engine in transit path
path "transit/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}