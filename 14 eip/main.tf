######################################################################
# Create EIP
######################################################################
resource "huaweicloud_vpc_eip" "this" {
  for_each = var.eip

  publicip {
    type = each.value.type
  }

  bandwidth {
    share_type  = each.value.shareType
    name        = each.value.name
    size        = each.value.size
    charge_mode = each.value.shareType
  }

}
