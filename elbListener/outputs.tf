######################################################################
# Out put ELB Listener ID
###################################################################### 
output "id" {
  description = "Output ELB listener ID"
  value = {
    for k, v in huaweicloud_elb_listener.this : k => v.id
  }
}