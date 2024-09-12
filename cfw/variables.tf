######################################################################
#  CFW variables
######################################################################
# variable "name" {
#   type = string
# }

# variable "east_west_firewall_inspection_cidr" {
#   type    = string
#   default = null
# }

# variable "east_west_firewall_er_id" {
#   type    = string
#   default = null
# }

# variable "flavor" {
#   type = string
# }

variable "cfw" {
  type = object({
    name                               = string
    east_west_firewall_inspection_cidr = optional(string, null)
    east_west_firewall_er_id           = optional(string, null)
    flavor                             = string
  })
}
