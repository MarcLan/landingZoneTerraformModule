######################################################################
# VPN Customer Gateway variables
######################################################################
variable "vpnCustomerGateway" {
  description = "The variables of customer gateway"
  type = map(object({
    region          = optional(string, null)
    name            = string
    identifierType  = optional(string, null) # IP or fqdn
    identifierValue = optional(string, null) # IP cidr
    asn             = string
    tags            = optional(map(any))
  }))
}
