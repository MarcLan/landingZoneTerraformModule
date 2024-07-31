module "kms" {
  source = "../01 kms"
  KMSs = {
    "kms3" = {
      keyAlias    = "kms-3"
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
