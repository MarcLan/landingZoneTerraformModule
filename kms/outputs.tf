######################################################################
# Output KMSs IDs
###################################################################### 
output "id" {
  description = "Output KMSs IDs"
  value = {
    for k, v in huaweicloud_kms_key.this : k => v.id
  }
}