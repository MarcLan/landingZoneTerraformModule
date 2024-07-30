######################################################################
# CTS Variables
######################################################################
variable "cts" {
  type = map(object({

    region              = optional(string, "ap-southeast-2")
    bucketName          = optional(string, "")
    #filePrefix          = optional(string, "")
    ltsEnabled          = optional(bool, true)
    organizationEnabled = optional(bool, true)
    validateFile        = optional(bool, true)
    kmsID               = optional(string, "")
    compressType        = optional(string, "gzip") # Can be "gzip" or "json"
    enabled             = optional(bool, true)
    tags                = optional(map(any))

  }))
}
