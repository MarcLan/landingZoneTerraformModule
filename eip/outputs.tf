######################################################################
# output EIP IDs
######################################################################
output "id" {
  description = "Output EIP instance id"
  value = {
    for k, v in huaweicloud_vpc_eip.this : k => v.id
  }
}
