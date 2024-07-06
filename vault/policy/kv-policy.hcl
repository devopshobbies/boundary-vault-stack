# vault initial policy file

path "kee/*" {
    capabilities = ["read"]
}

path "kv/*" {
    capabilities = ["read"]
}