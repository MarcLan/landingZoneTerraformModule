######################################################################
# Create OBS - Object Storage Service
######################################################################
resource "huaweicloud_obs_bucket" "this" {
  for_each      = var.OBS
  bucket        = each.value.bucketName
  storage_class = each.value.storageClass
  acl           = each.value.acl
  sse_algorithm = each.value.encryption
  kms_key_id    = each.value.kmsKeyID
  multi_az      = each.value.multiAZ
}
