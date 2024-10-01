######################################################################
# Create Shared ELB Listener
######################################################################
resource "huaweicloud_lb_listener" "this" {
  for_each                  = var.listener
  protocol                  = each.value.protocol
  protocol_port             = each.value.port
  loadbalancer_id           = each.value.lbID
  default_tls_container_ref = each.value.certID
  sni_container_refs        = each.value.certSNI
  default_pool_id           = each.value.backendGroup
}
