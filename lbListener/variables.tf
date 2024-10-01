######################################################################
# Shard ELB Listener Variables
######################################################################
variable "listener" {
  type = map(object({
    protocol     = string
    port         = string
    lbID         = string
    region       = optional(string, null)
    name         = optional(string, null)
    description  = optional(string, "createdByTerraform")
    certID       = optional(string, null)
    certSNI      = optional(list(string))
    backendGroup = optional(string, null)
  }))
}
