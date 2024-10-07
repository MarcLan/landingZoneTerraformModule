######################################################################
# Output Nat Gateway ID
###################################################################### 
output "id" {
  description = "Output nat gateway id"
  value = {
    for k, v in huaweicloud_nat_gateway.this : k => v.id 
  }
}