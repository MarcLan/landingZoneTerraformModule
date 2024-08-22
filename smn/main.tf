######################################################################
# Create SMN Topic with multiple Subscriptions
######################################################################
resource "huaweicloud_smn_topic" "this" {
  for_each = var.smn
  region   = each.value.region
  name     = each.value.name
}


resource "huaweicloud_smn_subscription" "this" {
  for_each = {
    for subValue in local.subscription : "${subValue.topicKey}.${subValue.subKey}" => subValue
  }
  region    = each.value.region
  topic_urn = each.value.topicURN
  protocol  = each.value.protocol
  endpoint  = each.value.endpoint
}

locals {
  subscription = flatten([
    for topicKey, topicValue in var.smn : [
      for subKey, subValue in topicValue.subscription : {
        topicKey = topicKey
        subKey   = subKey
        topicURN = huaweicloud_smn_topic.this[topicKey].id
        region   = subValue.region
        protocol = subValue.protocol
        endpoint = subValue.endpoint
      }
    ]
  ])
}
