######################################################################
# Create ELB - Elastic Load Balance
######################################################################
resource "huaweicloud_elb_loadbalancer" "this" {
  for_each          = var.elb
  region            = each.value.region
  name              = each.value.name
  availability_zone = each.value.AZ
  vpc_id            = each.value.vpcID
  ipv4_subnet_id    = each.value.subnetID
  ipv4_address      = each.value.ipAddress
  ipv4_eip_id       = each.value.eipID
  l4_flavor_id      = each.value.l4FlavorID
  l7_flavor_id      = each.value.l7FlavorID
  backend_subnets   = each.value.backendSubnets
  tags              = each.value.tags
  cross_vpc_backend = each.value.ipAsBackendServer
  description       = each.value.description
}
