######################################################################
# OBS ACL
######################################################################
variable "obsACL" {
  description = "obs acl variables"

  type = map(object({

    region = optional(string, null)
    bucket = string
    # accountPermissions =object({
    accountPermission = list(object({
      accountID      = string
      accessToBucket = list(string)
      accessToACL    = list(string)
    }))


    # })

  }))
}

