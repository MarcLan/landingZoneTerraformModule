######################################################################
# CTS variables
######################################################################
variable "cts" {
  description = "The variables of cts"
  type = map(object({
    region              = optional(string, null)
    obsBucketName       = optional(string, null)
    filePrefix          = optional(string, null)
    ltsEnabled          = optional(bool, null)
    organizationEnabled = optional(bool, false)
    validateFile        = optional(bool, true)
    kmsID               = optional(string, null)
    compressType        = optional(string, null) # gzip(default), json
    enabled             = optional(bool, true)
    tags                = optional(map(any))

    # notificationName = optional(string, null)
    # operationType    = optional(string, "complete") # complete, customized
    # smnTopic         = optional(string, null)

    # operations = map(object({
    #   operationService   = optional(string, null)
    #   operationResource  = optional(string, null)
    #   operationTraceName = optional(list(string))
    # }))

    # operationService   = optional(string, null)
    # operationResource  = optional(string, null)
    # operationTraceName = optional(list(string))

    # operationUsersGroup = list(string)
    # operationUsers      = list(string)

  }))
}

