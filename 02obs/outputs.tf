######################################################################
# Output OBS bucket
######################################################################
output "bucket" {
  description = "Output OBS bucket"
  value = {
    for k, v in huaweicloud_obs_bucket.this : k => v.bucket
  }
}
