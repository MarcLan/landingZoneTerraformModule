######################################################################
# Create CTS
######################################################################
resource "huaweicloud_cts_tracker" "this" {
  for_each             = var.cts
  region               = each.value.region
  bucket_name          = each.value.obsBucketName
  file_prefix          = each.value.filePrefix
  lts_enabled          = each.value.ltsEnabled
  organization_enabled = each.value.organizationEnabled
  validate_file        = each.value.validateFile
  kms_id               = each.value.kmsID
  compress_type        = each.value.compressType
  enabled              = each.value.enabled
  tags                 = {}
}



#   operation_users {
#     group = each.value.operationUsersGroup
#     users = each.value.operationUsers
#   }


# locals {
#   cts = flatten([
#     for groupKey, groupValue in var.cts : [
#       for streamKey, streamValue in groupValue.streams : {
#         groupKey   = groupKey
#         streamKey  = streamKey
#         groupID    = huaweicloud_lts_group.this[groupKey].id
#         streamName = streamValue.streamName
#       }
#     ]
#   ])
# }