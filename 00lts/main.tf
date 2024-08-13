######################################################################
# Create multiple Log Tank Service gourps with multiple streams
######################################################################

resource "huaweicloud_lts_group" "this" {
  for_each    = var.lts
  group_name  = each.value.groupName
  ttl_in_days = each.value.groupTTL
}

resource "huaweicloud_lts_stream" "this" {
  depends_on = [huaweicloud_lts_group.this]
  for_each = {
    for streamValue in local.lts : "${streamValue.groupKey}.${streamValue.streamKey}" => streamValue
  }
  stream_name = each.value.streamName
  group_id    = each.value.groupID
}


######################################################################
# Flatten([]) takes a list and replaces any elements 
# that are lists with a flattened sequence of the list contents.
######################################################################

locals {
  lts = flatten([
    for groupKey, groupValue in var.lts : [
      for streamKey, streamValue in groupValue.streams : {
        groupKey   = groupKey
        streamKey  = streamKey
        groupID    = huaweicloud_lts_group.this[groupKey].id
        streamName = streamValue.streamName
      }
    ]
  ])
}
