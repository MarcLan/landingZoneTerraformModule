######################################################################
# output VPN Gateway ID
######################################################################
output "vpnID" {
  description = "Output VPN Gateway id"
  value = {
    for k, v in huaweicloud_vpn_gateway.this : k => v.id
  }
}
