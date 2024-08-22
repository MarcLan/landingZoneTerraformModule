######################################################################
# Create VPN Connection
######################################################################
resource "huaweicloud_vpn_connection" "this" {
  for_each            = var.vpnConnection
  region              = each.value.region
  name                = each.value.name
  gateway_id          = each.value.gatewayID
  gateway_ip          = each.value.gatewayIP
  customer_gateway_id = each.value.customerGatewayID
  peer_subnets        = each.value.peerSubnets
  vpn_type            = each.value.vpnType
  psk                 = each.value.psk
  ha_role             = each.value.haRole

  tunnel_local_address = each.value.tunnelLocalAddress
  tunnel_peer_address  = each.value.tunnelPeerAddress

  ikepolicy {
    authentication_algorithm = each.value.ikePolicy["authenticationAlgorithm"]
    authentication_method    = each.value.ikePolicy["authenticationMethod"]
    encryption_algorithm     = each.value.ikePolicy["encryptionAlgorithm"]
    lifetime_seconds         = each.value.ikePolicy["lifeTimeSeconds"]
    ike_version              = each.value.ikePolicy["ikeVersion"]
    dh_group                 = each.value.ikePolicy["dhGroup"]
    pfs                      = each.value.ikePolicy["pfs"]
  }

  ipsecpolicy {
    authentication_algorithm = each.value.ipsecPolicy["authenticationAlgorithm"]
    encapsulation_mode       = each.value.ipsecPolicy["encapsulationMode"]
    encryption_algorithm     = each.value.ipsecPolicy["encryptionAlgorithm"]
    lifetime_seconds         = each.value.ipsecPolicy["lifeTimeSeconds"]
    pfs                      = each.value.ipsecPolicy["pfs"]
    transform_protocol       = each.value.ipsecPolicy["transformProtocol"]
  }

}
