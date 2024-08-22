######################################################################
# VPN Connection variables
######################################################################
variable "vpnConnection" {
  description = "The variables of VPN connection"
  type = map(object({
    region            = optional(string, null)
    name              = string
    gatewayID         = string
    gatewayIP         = string
    customerGatewayID = string
    peerSubnets       = optional(list(string))
    vpnType           = string # policy, static or bgp.
    psk               = string
    enableNQA         = optional(bool, false)
    haRole            = optional(string, "master")

    tunnelLocalAddress = optional(string, null)
    tunnelPeerAddress  = optional(string, null)

    ikePolicy = object({
      ikeVersion              = optional(string, "v2")
      authenticationAlgorithm = optional(string, null)
      authenticationMethod    = optional(string, null)
      encryptionAlgorithm     = optional(string, null)
      lifeTimeSeconds         = optional(string, null)
      dhGroup                 = optional(string, null)
      pfs                     = optional(string, null)
    })

    ipsecPolicy = object({
      authenticationAlgorithm = optional(string, null)
      encapsulationMode       = optional(string, null)
      encryptionAlgorithm     = optional(string, null)
      lifeTimeSeconds         = optional(string, null)
      pfs                     = optional(string, null)
      transformProtocol       = optional(string, "esp")
    })

  }))
}
