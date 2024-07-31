######################################################################
# Create CTS - Cloud Trace Service
######################################################################
resource "huaweicloud_cts_tracker" "this" {
  
   for_each             = var.cts
  region               = each.value.region
  bucket_name          = each.value.bucketName
  #file_prefix          = each.value.filePrefix
  lts_enabled          = each.value.ltsEnabled
  organization_enabled = each.value.organizationEnabled
  validate_file        = each.value.validateFile
  kms_id               = each.value.kmsID
  enabled              = each.value.enabled
  compress_type        = each.value.compressType
  tags                 = each.value.tags

}
