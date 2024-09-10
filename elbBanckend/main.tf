######################################################################
# Create ELB Listener
######################################################################
resource "huaweicloud_elb_pool" "this" {
  for_each        = var.backend
  name            = each.value.name
  protocol        = each.value.protocol
  lb_method       = each.value.method
  loadbalancer_id = each.value.loadbalancerID
  listener_id     = each.value.listenerID
}

resource "huaweicloud_elb_member" "this" {
  depends_on = [huaweicloud_elb_pool.this]
  for_each = {
    for serverValue in local.servers : "${serverValue.groupKey}.${serverValue.serverKey}" => serverValue
  }
  pool_id       = each.value.groupID
  address       = each.value.address
  protocol_port = each.value.port
}



locals {
  servers = flatten([
    for groupKey, groupValue in var.backend : [
      for serverKey, serverValue in groupValue.servers : {
        groupKey  = groupKey
        serverKey = serverKey
        groupID   = huaweicloud_elb_pool.this[groupKey].id
        address   = serverValue.address
        port      = serverValue.port
      }
    ]
  ])
}
