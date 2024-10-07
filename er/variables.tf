######################################################################
#  Enterprise Router variables
######################################################################
variable "er" {
  description = "Create ER instance with Attachments and Route Tables"

  type = map(object({

    availabilityZones = list(string)
    name              = string
    asn               = string
    description       = optional(string, "createdByTerraform")
    enterpriseProject = optional(string, "") # Empty means the Default project

    enableDefaultAssociation    = optional(bool, false)
    enableDefaultPropagation    = optional(bool, false)
    autoAcceptSharedAttachments = optional(bool, true)
    autoCreateVpcRoutes         = optional(bool, false)

    attachments = optional(map(object({
      name                = string
      vpcID               = string
      subnetID            = string
      autoCreateVpcRoutes = optional(bool, false)
      description         = optional(string, "createdByTerraform")

    })))

  }))
}

