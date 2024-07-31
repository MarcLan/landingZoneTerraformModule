######################################################################
# Variables of OBS
######################################################################
variable "OBS" {
  type = map(object({

    bucketName      = string
    storageClass    = optional(string, "STANDARD")
    acl             = string
    encryption      = optional(string, "kms")
    kmsKeyID        = string
    multiAZ         = bool

  }))
}
