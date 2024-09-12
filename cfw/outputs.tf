######################################################################
# Output CFW ID
###################################################################### 
output "cfw" {
  description = "Output CFW ID"
  value       = huaweicloud_cfw_firewall.this.id
}
