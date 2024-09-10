######################################################################
# Outputs Shared ELB Listener ID
######################################################################
output "id" {
  description = "Output Shared ELB listener ID"
  value = {
    for k, v in huaweicloud_lb_listener.this : k => v.id
  }
}