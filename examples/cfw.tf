######################################################################
# Create CFW with CFW module
######################################################################
module "cfw" {
  source = "../cfw"
  cfw = {
    name                               = "cfwTest"
    flavor                             = "Professional"
    east_west_firewall_er_id           = ""
    east_west_firewall_inspection_cidr = ""
    east_west_firewall_mode            = ""
  }
}
