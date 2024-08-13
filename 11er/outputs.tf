######################################################################
# Out put ER ids
###################################################################### 
output "erID" {
  description = "Output ER instance ID"
  value = {
    for k, v in huaweicloud_er_instance.this : k => v.id
  }
}

output "attachmentsID" {
  description = "Output ER Attachments IDs"
  value = {
    for k, v in huaweicloud_er_vpc_attachment.this : k => v.id
  }
}