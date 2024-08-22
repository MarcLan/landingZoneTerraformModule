######################################################################
# Create ELB - Elastic Loadbalance
######################################################################
resource "huaweicloud_lb_loadbalancer" "this" {
  for_each              = var.elb
  description           = each.value.description
  region                = each.value.region
  name                  = each.value.name
  vip_subnet_id         = each.value.subnetID
  vip_address           = each.value.address
  tags                  = each.value.tags
  enterprise_project_id = each.value.enterpriseProjectID
}
