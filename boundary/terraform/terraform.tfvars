# ssh conf

hosts_info = [ {
 name = "development",
 ip = "192.168.1.15",
 ssh_user = "vagrant",
 ssh_port = "2222"
  ssh_key_path = "~/.ssh/id_rsa",
 ssh_key_name = "dev_priv_key"
  }
]

# domain model
clients = {
  "tech-lead" : "tech.lead",
}

admins = {
  "devops" = "devops.eng"
}

readonly_users = {
  "operator" = "operator"
}

main_server_ips = [
  "192.168.1.15"
]

main_server_names = [
  "development",
  "staging",
  "production"
  ]

test_server_name = "testing"
test_ssh_port = 22

# provider variables
boundary_address = "https://boundary.dvh.tech"

auth_method_id = "auth_method_id"
login_name     = "userpassName"
login_password = "userpassPassword"

# credential stores
main_cred_store_name = "main_servers_ssh_creds"

# permissions and roles

## all grants
all_list    = "id=*;type=*;actions=list,no-op"
all_read    = "id=*;type=*;actions=read,list"
all_actions = "id=*;type=*;actions=*"

## targets
target_read_list         = "id=*;type=target;actions=read,list"
target_list              = "id=*;type=target;actions=list,no-op;output_fields=scope_id,name,description"
target_authorize_session = "id=*;type=target;actions=authorize-session"
target_crud              = "id=*;type=target;actions=read,create,delete,update"
target_add_creds         = "id=*;type=target;actions=add-credential-sources"

## auth method
auth_method_list         = "id=*;type=auth-method;actions=list,no-op;output_fields=scope_id,name,description"
auth_method_authenticate = "id=*;type=auth-method;actions=authenticate"

## group and hosts and users
group_list          = "id=*;type=group;actions=list,no-op;output_fields=scope_id,name,description"
host_list           = "id=*;type=host;actions=list,no-op;output_fields=scope_id,name,description"
host_catalog_list   = "id=*;type=host-catalog;actions=list,no-op;output_fields=scope_id,name,description"
host_sets_list      = "id=*;type=host-set;actions=list,no-op;output_fields=scope_id,name,description"
host_sets_list_read = "id=*;type=user;actions=list,read"
user_list           = "id=*;type=user;actions=list,no-op;output_fields=scope_id,name,description"

## roles and sessions
role_list                   = "id=*;type=role;actions=list,no-op;output_fields=scope_id,name,description"
session_read_list           = "id=*;type=session;actions=list,read:self"
session_recording_list      = "id=*;type=session-recording;actions=list,read:self"
session_recording_read_list = "id=*;type=session-recording;actions=list,read"

# vault cred store
vault_sign_path = "ssh-signer/issue/boundary-client"
vault_username  = "admin"
vault_address   = "http://vault:8200"