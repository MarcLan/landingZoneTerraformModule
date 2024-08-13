######################################################################
# VPN Customer Gateway variables
######################################################################
variable "vpnCustomerGateway" {
  description = "The variables of customer gateway"
  type = map(object({
    region          = optional(string, null)
    name            = string
    identifierType  = string # IP or fqdn
    identifierValue = string # IP cidr
    asn             = string
    tags            = optional(map(any))
  }))
}
