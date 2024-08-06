######################################################################
# Create multiple Routes in each VPC
######################################################################
resource "huaweicloud_vpc_route" "this" {
  for_each    = var.routes
  vpc_id      = each.value.vpcID
  type        = each.value.type
  nexthop     = each.value.nexthop
  destination = each.value.destination
}
