######################################################################
# Out put Log Tank Service groups and Streams IDs for other resources
###################################################################### 

output "groupIDs" {
  description = "Output Log Tank Service Groups IDs"
  value = {
    for k, v in huaweicloud_lts_group.this : k => v.id 
  }
}

output "streamIDs" {
  description = "Output Log Tank Service Steams IDs"
  value = {
    for k, v in huaweicloud_lts_stream.this : k => v.id 
  }
}