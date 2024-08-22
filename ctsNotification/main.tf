######################################################################
# Create CTS Notification
######################################################################
resource "huaweicloud_cts_notification" "this" {
  for_each       = var.notification
  region         = each.value.region
  name           = each.value.name
  operation_type = each.value.operationType
  smn_topic      = each.value.smnTopic
  operations {
    service     = each.value.operationService
    resource    = each.value.operationResource
    trace_names = each.value.operationName
  }

}
