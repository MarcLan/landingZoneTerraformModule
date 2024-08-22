######################################################################
# Create NAT Gateway
######################################################################
resource "huaweicloud_nat_gateway" "this" {
  for_each              = var.nat
  vpc_id                = each.value.vpcID
  subnet_id             = each.value.subnetID
  description           = each.value.description
  region                = each.value.region
  name                  = each.value.name
  spec                  = each.value.spec
  enterprise_project_id = each.value.enterpriseProjectID
  tags                  = each.value.tags
}

######################################################################
# Create NAT Gateway rules
######################################################################
resource "huaweicloud_nat_snat_rule" "name" {
  for_each = {
    for snatValue in local.snats : "${snatValue.natKey}.${snatValue.snatKey}" => snatValue
  }
  nat_gateway_id = each.value.natID
  region         = each.value.region
  source_type    = each.value.sourceType
  subnet_id      = each.value.subnetID
  cidr           = each.value.cidr
  floating_ip_id = each.value.eipID
  description    = each.value.description
}

######################################################################
# Flat variables nat
######################################################################
locals {
  snats = flatten([
    for natKey, natValue in var.nat : [
      for snatKey, snatValue in natValue.snats : {
        natKey  = natKey
        snatKey = snatKey

        natID       = huaweicloud_nat_gateway.this[natKey].id
        region      = snatValue.region
        sourceType  = snatValue.sourceType
        subnetID    = snatValue.subnetID
        cidr        = snatValue.cidr
        eipID       = snatValue.eipID
        description = snatValue.description
      }
    ]
  ])
}
