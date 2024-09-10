######################################################################
# Output CFW ID
###################################################################### 
output "cfw" {
  description = "Output CFW ID"
  value = {
    for k, v in huaweicloud_cfw_firewall : k => v.id 
  }
}