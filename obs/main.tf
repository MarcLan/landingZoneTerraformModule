######################################################################
# Create multiple OBS with account permissions 
######################################################################
resource "huaweicloud_obs_bucket" "this" {
  for_each      = var.obs
  region        = each.value.region
  bucket        = each.value.bucket
  multi_az      = each.value.multiAZ
  acl           = each.value.acl
  encryption    = each.value.encryption
  sse_algorithm = each.value.keyType
  kms_key_id    = each.value.kmsKeyID
}

# resource "huaweicloud_obs_bucket_acl" "this" {
#   depends_on = [huaweicloud_obs_bucket.this]
#   #for_each   = var.obs
#   for_each = {
#     for aclValue in local.obs : "${aclValue.obsKey}.${aclValue.aclKey}" => aclValue
#   } 
#   #region = each.value.region
#   bucket = each.value.bucket
#   account_permission {
#     account_id       = each.value.accountID
#     access_to_bucket = each.value.accessToBucket
#     access_to_acl    = each.value.accessToACL
#   }
# }

# #####################################################################
# Flatten([]) takes a list and replaces any elements 
# that are lists with a flattened sequence of the list contents.
# #####################################################################
# locals {
#   obs = flatten([
#     for obsKey, obsValue in var.obs : [
#       for aclKey, aclValue in obsValue.accountPermission : {
#         obsKey         = obsKey
#         aclKey         = aclKey
#         bucket         = huaweicloud_obs_bucket.this[obsKey].bucket
#         accessToBucket = aclValue.accessToBucket
#         accessToACL    = aclValue.accessToACL
#         accountID      = aclValue.accountID
#       }
#     ]
#   ])
# }
