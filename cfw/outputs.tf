######################################################################
# Output CFW ID
###################################################################### 
# output "cfw" {
#   description = "Output CFW ID"
#   value = {
#     for k, v in huaweicloud_cfw_firewall.this : k => v.id 
#   }
# }

output "cfw" {
  description = "Output CFW ID"
  value       = huaweicloud_cfw_firewall.this.id
}
