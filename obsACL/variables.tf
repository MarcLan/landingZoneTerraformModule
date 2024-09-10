######################################################################
# OBS ACL
######################################################################
# variable "obsACL" {
#   description = "obs acl variables"
#   type = object({

#     region = optional(string, null)
#     bucket = string
#     # accountID      = string
#     # accessToBucket = list(string)
#     # accessToACL    = list(string)

#   })
# }

variable "bucket" {
  type = string
}

variable "accountPermission" {
  description = "The ACL list"
  type = list(object({
    accountID      = string
    accessToBucket = list(string)
    accessToACL    = list(string)
  }))

}
