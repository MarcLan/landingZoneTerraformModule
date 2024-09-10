######################################################################
# Outputs
######################################################################
output "id" {
  description = "Output ELB Backend Server Group ID"
  value = {
    for k, v in huaweicloud_elb_pool.this : k => v.id
  }
}