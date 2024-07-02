listener "tcp" {
 address = "0.0.0.0:8200"
 tls_disable = true
 #tls_cert_file = "/path/to/fullchain.pem"
 #tls_key_file  = "/path/to/privkey.pem"
}

storage "raft" {
  path    = "/vault/data"
  # maximum record/entry vault accepts from clients
  max_entry_size = 1048576
  node_id = "node1"
}

# login limit for users

user_lockout "userpass" {
  lockout_threshold = "3"
  lockout_duration = "10m"
}

api_addr = "http://localhost:8200"
cluster_addr = "http://127.0.0.1:8201"
ui = true