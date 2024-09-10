######################################################################
# Out put ELB ID
###################################################################### 
output "id" {
  description = "Output ELB ID"
  value = {
    for k, v in huaweicloud_elb_loadbalancer.this : k => v.id
  }
}