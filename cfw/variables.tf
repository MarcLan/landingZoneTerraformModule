######################################################################
#  Cloud Firewall variables
######################################################################
variable "name" { type = string }
variable "east_west_firewall_inspection_cidr" { type = string }
variable "east_west_firewall_er_id" { type = string }
variable "flavor" { type = string }

# variable "cfw" {
#   type = map(object({

#     name                               = string
#     east_west_firewall_inspection_cidr = string
#     east_west_firewall_mode            = string
#     east_west_firewall_er_id           = string
#     flvor                              = string

#   }))

# }
