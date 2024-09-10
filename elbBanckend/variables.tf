######################################################################
# ELB Listener Variables
######################################################################
variable "backend" {
  type = map(object({

    region   = optional(string, null)
    name     = string
    protocol = string # TCP, UDP, HTTP, HTTPS, QUIC, GRPC or TLS.
    method   = string
    # ROUND_ROBIN: weighted round-robin.
    # LEAST_CONNECTIONS: weighted least connections.
    # SOURCE_IP: source IP hash.
    # QUIC_CID: connection ID.
    type           = optional(string, null) # instance, ip
    loadbalancerID = optional(string, null)
    listenerID     = optional(string, null)
    vpcID          = optional(string, null)

    servers = map(object({
      address = string
      port    = string
    }))

  }))
}
