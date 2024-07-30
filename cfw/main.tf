######################################################################
# Create CFW - Cloud Firewall
######################################################################
resource "huaweicloud_cfw_firewall" "this" {
  name                               = var.name
  east_west_firewall_er_id           = var.east_west_firewall_er_id
  east_west_firewall_inspection_cidr = var.east_west_firewall_inspection_cidr
  flavor {
    version = var.flavor
  }
}
