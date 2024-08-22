######################################################################
# output VPN Connection ID
######################################################################
output "vpnConnectionID" {
  description = "Output VPN Connection id"
  value = {
    for k, v in huaweicloud_vpn_connection.this : k => v.id
  }
}
