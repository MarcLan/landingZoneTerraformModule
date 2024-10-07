######################################################################
# Create Shared ELB Backend Group
######################################################################
resource "huaweicloud_lb_pool" "this" {
  for_each        = var.backend
  protocol        = each.value.protocol
  lb_method       = each.value.method
  region          = each.value.region
  name            = each.value.name
  description     = each.value.description
  loadbalancer_id = each.value.lbID
  listener_id     = each.value.listenerID

  persistence {
    type        = each.value.persistenceType
    timeout     = each.value.persistenceTimeout
    cookie_name = each.value.cookieName
  }

}

resource "huaweicloud_lb_member" "this" {
  depends_on = [huaweicloud_lb_pool.this]
  for_each = {
    for serverValue in local.servers : "${serverValue.groupKey}.${serverValue.serverKey}" => serverValue
  }
  pool_id       = each.value.groupID
  address       = each.value.address
  protocol_port = each.value.port
  subnet_id     = each.value.ipv4SubnetID
}

locals {
  servers = flatten([
    for groupKey, groupValue in var.backend : [
      for serverKey, serverValue in groupValue.servers : {
        groupKey     = groupKey
        serverKey    = serverKey
        groupID      = huaweicloud_lb_pool.this[groupKey].id
        address      = serverValue.address
        port         = serverValue.port
        ipv4SubnetID = serverValue.ipv4SubnetID
      }
    ]
  ])
}
