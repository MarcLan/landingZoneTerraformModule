######################################################################
# ELB Variables
######################################################################
variable "elb" {
  type = map(object({
    region         = optional(string, null)
    name           = string
    AZ             = list(string)
    vpcID          = optional(string, null)
    subnetID       = optional(string, null)
    ipAddress      = optional(string, null)
    eipID          = optional(string, null)
    l4FlavorID     = optional(string, null)
    l7FlavorID     = optional(string, null)
    backendSubnets = optional(list(string)) # ipv4SubnetID
    tags           = optional(map(string))
    description    = optional(string, "createByTerraform")
  }))
}
