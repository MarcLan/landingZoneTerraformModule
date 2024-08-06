module "kms" {
  source = "../01kms"
  kms = {
    "kms4" = {
      keyAlias    = "kms-4"
      pendingDays = 7
      grants = {
        grant1 = {
          grantName        = "grant-1"
          grantOperations  = ["create-datakey", "describe-key"]
          granteePrincipal = data.huaweicloud_account.current.id
        }
      }
    }
  }
}

data "huaweicloud_account" "current" {}

output "current_account_id" {
  value = data.huaweicloud_account.current.id
}
