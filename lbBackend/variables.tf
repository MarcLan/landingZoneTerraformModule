######################################################################
# Shard ELB variables
######################################################################
variable "backend" {
  type = map(object({
    protocol    = string # TCP, UDP, HTTP
    method      = string # ROUND_ROBIN, LEAST_CONNECTIONS, SOURCE_IP
    region      = optional(string, null)
    name        = optional(string, null)
    description = optional(string, "createdByTerraform")
    lbID        = optional(string, null)
    listenerID  = optional(string, null)


    servers = map(object({
      address      = string
      port         = string
      ipv4SubnetID = string
    }))

  }))
}
