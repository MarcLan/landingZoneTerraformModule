######################################################################
#  Secuirty Group variable in map(object({}))
######################################################################

variable "sgs" {
  description = "Security Groups variables"
  default = {}
  type = map(object({

    name        = string
    description = optional(string, null)
    rules = map(object({

      direction        = string
      action           = string
      ethertype        = string
      ports            = string
      remote_ip_prefix = string
      priority         = optional(string, null)
      description      = optional(string, null)
      protocol         = optional(string, null)
      port_range_min   = optional(string, null)
      prot_range_max   = optional(string, null)

    }))
  }))
}
