######################################################################
# output EIP IDs
######################################################################
output "eipIDs" {
  description = "Output EIPs instance IDs"
  value = {
    for k, v in huaweicloud_vpc_eip.this : k => v.id
  }
}
