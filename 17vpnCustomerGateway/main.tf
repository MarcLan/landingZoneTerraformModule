######################################################################
# Create VPN Customer Gateway
######################################################################
resource "huaweicloud_vpn_customer_gateway" "this" {
  for_each = var.vpnCustomerGateway
  name     = each.value.name
  asn      = each.value.asn
  id_type  = each.value.identifierType
  id_value = each.value.identifierValue
  tags     = each.value.tags
}
