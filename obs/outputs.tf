######################################################################
# Output OBS bucket name
###################################################################### 
output "groupID" {
  description = "Output bucket name"
  value = {
    for k, v in huaweicloud_obs_bucket.this : k => v.bucket
  }
}

