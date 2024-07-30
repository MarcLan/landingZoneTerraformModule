######################################################################
# Create NAT Gateway
######################################################################
resource "huaweicloud_nat_gateway" "this" {
  for_each              = var.nat
  descrption            = each.value.description
  region                = each.value.region
  name                  = each.value.name
  spec                  = each.value.spec
  ip                    = each.value.ip
  enterprise_project_id = each.value.enterpriseProjectID
  tags                  = each.value.tags
}
