######################################################################
# Create OBS ACL
######################################################################
resource "huaweicloud_obs_bucket_acl" "this" {
  for_each = var.obsACL
  bucket   = each.value.bucket
  account_permission {
    account_id       = each.value.accountID
    access_to_bucket = each.value.accessToBucket
    access_to_acl    = each.value.accessToACL
    # account_id       = each.value.accountPermission["0"]
    # access_to_bucket = each.value.accountPermission[1]
    # access_to_acl    = each.value.accountPermission[2]
  }

}
