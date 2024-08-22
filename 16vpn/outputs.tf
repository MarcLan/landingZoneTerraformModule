######################################################################
# output VPN Gateway ID
######################################################################
output "id" {
  description = "Output VPN Gateway id"
  value = {
    for k, v in huaweicloud_vpn_gateway.this : k => v.id
  }
}

output "activeEIP" {
  description = "Output VPN active ip id"
  value = {
    for k, v in huaweicloud_vpn_gateway.this : k => v.eip1[0].id
  }
}

output "standbyEIP" {
  description = "Output VPN standby ip id"
  value = {
    for k, v in huaweicloud_vpn_gateway.this : k => v.eip2[0].id
  }
}
