######################################################################
# VPN Gateway variables
######################################################################
variable "vpn" {
  description = "The variables of vpn gateway"
  type = map(object({
    region            = optional(string, null)
    name              = string
    availabilityZones = list(string)
    asn               = optional(string, null)
    haMode            = optional(string, "active-active") # active-active(Default), active-standby
    flavor            = optional(string, "Professional1") # Basic, Professional1(Default) and Professional2
    networkType       = optional(string, "public")        # public(Default), private

    attachmentType = optional(string, "er") # vpc(Default), ER
    erID           = optional(string, null)
    vpcID          = optional(string, null)
    #localSubnets      = optional(string, "")
    connectSubnet    = optional(string, null)
    accessVpcID      = optional(string, null)
    accessSubnetID   = optional(string, null)
    accessPrivateIP1 = optional(string, null)
    accessPrivateIP2 = optional(string, null)

    eip1 = object(
      {
        type          = optional(string, "5_bgp")
        bandwidthName = optional(string, "vpnEIP1")
        bandwidthSize = optional(string, 5)
        chargeMode    = optional(string, "traffic") # traffic(default) or bandwidth
      }
    )

    eip2 = object(
      {
        type          = optional(string, "5_bgp")
        bandwidthName = optional(string, "vpnEIP2")
        bandwidthSize = optional(string, 5)
        chargeMode    = optional(string, "traffic") # traffic(default) or bandwidth
      }
    )

  }))
}
