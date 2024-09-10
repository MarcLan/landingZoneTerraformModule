######################################################################
# Create VPN Gateway
######################################################################
resource "huaweicloud_vpn_gateway" "this" {
  for_each           = var.vpn
  region             = each.value.region
  name               = each.value.name
  availability_zones = each.value.availabilityZones
  asn                = each.value.asn
  er_id              = each.value.erID
  ha_mode            = each.value.haMode
  flavor             = each.value.flavor
  attachment_type    = each.value.attachmentType
  network_type       = each.value.networkType
  vpc_id             = each.value.vpcID
  #local_subnets       = each.value.localSubnets
  connect_subnet      = each.value.connectSubnet
  access_vpc_id       = each.value.accessVpcID
  access_subnet_id    = each.value.accessSubnetID
  access_private_ip_1 = each.value.accessPrivateIP1
  access_private_ip_2 = each.value.accessPrivateIP2
  eip1 {
    type           = each.value.eip1["type"]
    bandwidth_name = each.value.eip1.bandwidthName
    bandwidth_size = each.value.eip1.bandwidthSize
    charge_mode    = each.value.eip1.chargeMode
  }
  eip2 {
    type           = each.value.eip2.type
    bandwidth_name = each.value.eip2.bandwidthName
    bandwidth_size = each.value.eip2.bandwidthSize
    charge_mode    = each.value.eip2.chargeMode
  }
}
