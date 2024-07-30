userpass_path    = "pass-login"
transit_keynames = ["root-boundary", "worker-auth-boundary", "recovery-boundary"]
login_creds = {
  "admin" = "administrator"
}
policies = {
  "admins"              = "policies/admin-policy.hcl",
  "boundary-transit"         = "policies/boundary-transit.hcl",
  "transit-admin" = "policies/transit-admin.hcl"
  "ssh"                 = "policies/ssh.hcl",
  "boundary-controller" = "policies/boundary-controller.hcl",
  "testapp" = "policies/testapp.hcl"
}