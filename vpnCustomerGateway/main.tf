######################################################################
# Create VPN Customer Gateway
######################################################################
resource "huaweicloud_vpn_customer_gateway" "this" {
  lifecycle {
    ignore_changes = [ route_mode ]
  }
  for_each   = var.vpnCustomerGateway
  name       = each.value.name
  asn        = each.value.asn
  id_type    = each.value.identifierType
  id_value   = each.value.identifierValue
  tags       = each.value.tags
  #route_mode = "bgp"
}
