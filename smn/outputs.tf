######################################################################
# Out put SMN id
###################################################################### 
output "urn" {
  description = "Out put SMN id"
  value = {
    for k, v in huaweicloud_smn_topic.this : k => v.topic_urn
  }
}