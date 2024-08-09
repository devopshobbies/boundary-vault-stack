variable "userpass_path" {
  type        = string
  description = "path to the userpass auth-method"
}

variable "transit_keynames" {
  type        = set(string)
  description = "transit-engine key name"
}

variable "login_creds" {
  type        = map(string)
  description = "vault userpass (admin) username and passwords"
}

variable "transit_admins" {
  type        = map(string)
  description = "vault userpass (transit admin) username and passwords"
}

variable "policies" {
  type        = map(string)
  description = "list of policy files"
}

variable "cipher_path" {
  type        = string
  description = "KV Version 2 secret engine mount for TESTAPP access ciphers"
  default     = "store"
}

variable "cipher_kv_name" {
  type        = string
  description = "TESTAPP ciphers kv engine name"
}