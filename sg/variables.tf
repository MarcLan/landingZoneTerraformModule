######################################################################
#  Secuirty Group variable in map(object({}))
######################################################################

variable "sg" {
  description = "Security Groups variables"
  default     = {}
  type = map(object({

    name        = string
    description = optional(string, null)
    rules = map(object({

      direction      = string
      action         = optional(string, "allow")
      ethertype      = string
      ports          = optional(string, null)
      remoteIpPrefix = optional(string, null)
      priority       = optional(string, null)
      description    = optional(string, null)
      protocol       = optional(string, null)
      portRangeMin   = optional(string, null)
      protRangeMax   = optional(string, null)
      ipGroupID      = optional(string, null)
      addresses      = optional(list(string))

    }))
  }))
}
