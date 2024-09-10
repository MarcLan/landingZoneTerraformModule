######################################################################
# ELB Variables
######################################################################
variable "listener" {
  type = map(object({
    region       = optional(string, null)
    name         = string
    elbID        = string
    protocol     = string # The protocol can either be TCP, UDP, HTTP, HTTPS, QUIC, IP or TLS. IP is only available for listeners that will be added to gateway load balancers.
    port         = optional(string, null)
    description  = optional(string, "createdByTerraform")
    accessPolicy = optional(string, null)
    ipGroup      = optional(string, null)
    cert         = optional(string, null)
  }))
}
