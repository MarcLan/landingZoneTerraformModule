######################################################################
# Create ELB Listener
######################################################################
resource "huaweicloud_elb_listener" "this" {
  for_each           = var.listener
  region             = each.value.region
  name               = each.value.name
  loadbalancer_id    = each.value.elbID
  protocol           = each.value.protocol
  protocol_port      = each.value.port
  description        = each.value.description
  access_policy      = each.value.accessPolicy
  ip_group           = each.value.ipGroup
  server_certificate = each.value.cert
}
