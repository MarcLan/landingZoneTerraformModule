######################################################################
# Out put Security Group IDs for other resources
###################################################################### 

output "id" {
  description = "Out put Security Group IDs for other resources"
  value = {
    for k, v in huaweicloud_networking_secgroup.this : k => v.id
  }
}