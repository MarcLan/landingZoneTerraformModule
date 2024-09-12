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
  }))
}

