######################################################################
# NAT variable
######################################################################
variable "eip" {
  description = "The EIP vaviables"
  type = map(object({

    region     = optional(string, "ap-southeast-2")
    type       = optional(string, "5_bgp")
    shareType  = optional(string, "PER")
    name       = string
    size       = string
    chargeMode = optional(string, "traffic")

  }))

}
