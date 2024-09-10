######################################################################
# Outputs Shared ELB Backend Group ID
######################################################################
output "id" {
  description = "Output Shared ELB backend group ID"
  value = {
    for k, v in huaweicloud_lb_pool.this : k => v.id
  }
}