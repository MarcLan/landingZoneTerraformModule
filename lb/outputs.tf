######################################################################
# Out put Shared ELB ID
###################################################################### 
output "id" {
  description = "Output Shared ELB ID"
  value = {
    for k, v in huaweicloud_lb_loadbalancer.this : k => v.id
  }
}