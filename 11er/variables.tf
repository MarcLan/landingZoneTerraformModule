######################################################################
#  Enterprise Router variables
######################################################################
variable "er" {
  description = "Create ER instance with Attachments and Route Tables"

  type = map(object({

    erAvailabilityZones = list(string)
    erName              = string
    erASN               = string
    erDescription       = optional(string, "Created by Terraform")
    erEnterpriseProject = optional(string, "") # Empty means the Default project

    enableDefaultAssociation    = optional(bool, false)
    enableDefaultPropagation    = optional(bool, false)
    autoAcceptSharedAttachments = optional(bool, false)

    attachments = optional(map(object({
      attachmentName        = string
      vpcID                 = string
      subnetID              = string
      autoCreateVpcRoutes   = optional(bool, false)
      attachmentDescription = optional(string, "Created by Terraform")
    })))

  }))
}

