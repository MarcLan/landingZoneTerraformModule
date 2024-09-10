######################################################################
# OBS bucket with buck acl in
######################################################################

variable "obs" {
  description = "obs variables"
  type = map(object({

    region     = optional(string, null)
    bucket     = string
    multiAZ    = optional(bool, true)
    acl        = optional(string, "private") # "private", "public-read", "public-read-write" and "log-delivery-write". Defaults to private
    encryption = optional(bool, true)
    keyType    = optional(string, "kms") # kms, AES256
    kmsKeyID   = optional(string, "")

    # accountPermission = map(object({
    #   accessToBucket = optional(list(string))
    #   accessToACL    = optional(list(string))
    #   accountID      = optional(string, null)
    # }))

  }))
}

# variable "acl" {
#   type = map(object({
#     region = optional(string, null)
#     # bucket         = optional(string, null)
#     accessToBucket = optional(list(string))
#     accessToACL    = optional(list(string))
#     accountID      = optional(string, null)
#   }))
# }


