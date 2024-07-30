######################################################################
# Out put Security Group IDs for other resources
###################################################################### 

output "sg_ids" {
  description = "Out put Security Group IDs for other resources"
  value = {
    for k, v in huaweicloud_networking_secgroup.this : k => v.id
  }
}