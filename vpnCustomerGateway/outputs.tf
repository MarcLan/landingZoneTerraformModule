######################################################################
# output VPN Customer Gateway ID
######################################################################
output "id" {
  description = "Output VPN Customer Gateway id"
  value = {
    for k, v in huaweicloud_vpn_customer_gateway.this : k => v.id
  }
}
