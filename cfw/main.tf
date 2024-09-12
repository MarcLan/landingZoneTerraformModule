######################################################################
# Create CFW - Cloud Firewall
######################################################################
resource "huaweicloud_cfw_firewall" "this" {
  name                               = var.cfw.name
 # east_west_firewall_er_id           = var.cfw.east_west_firewall_er_id
  #east_west_firewall_inspection_cidr = var.cfw.east_west_firewall_inspection_cidr
  flavor {
    version = var.cfw.flavor
  }
}
