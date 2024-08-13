######################################################################
# IAM Agency Variables
######################################################################
variable "iamAgency" {
  description = "the variables of IAM Agency"
  type = map(object({
    name              = string
    description       = optional(string, null)
    delegatedAccount  = optional(string, null)
    domainRoles       = optional(list(string))
    allResourcesRoles = optional(list(string))
    projectRoles = optional(object({
      project = string
      roles   = list(string)
    }))
  }))
}
