#---------------------
# Create policies
#---------------------

resource "vault_policy" "vault_policies" {
  for_each = var.policies

  name   = each.key
  policy = file(each.value)
}