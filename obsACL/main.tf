######################################################################
# Create OBS ACL
######################################################################
resource "huaweicloud_obs_bucket_acl" "this" {
  count  = length(var.accountPermission)
  bucket = var.bucket
  account_permission {
    account_id       = var.accountPermission[count.index].accountID
    access_to_bucket = var.accountPermission[count.index].accessToBucket
    access_to_acl    = var.accountPermission[count.index].accessToACL
    # account_id       = each.value.accountPermission["0"]
    # access_to_bucket = each.value.accountPermission[1]
    # access_to_acl    = each.value.accountPermission[2]
  }

}
