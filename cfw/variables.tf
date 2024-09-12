######################################################################
#  CFW variables
######################################################################
variable "cfw" {
  type = object({
    name                               = string
    east_west_firewall_inspection_cidr = optional(string, null)
    east_west_firewall_er_id           = optional(string, null)
    east_west_firewall_mode            = optional(string, null)
    flavor                             = string
  })
}
