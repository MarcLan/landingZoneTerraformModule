######################################################################
#  Enterprise Router variables
######################################################################
variable "routeTables" {
  description = "Create ER Route Tables with Associations & Propagations & Routes in"

  type = map(object({

    routeTableName        = string
    erID                  = string
    routeTableDescription = optional(string, "Created by Terraform")

    associations = map(object({
      erID         = string
      attachmentID = string
    }))

    propagations = map(object({
      erID         = string
      attachmentID = string
    }))

    routes = map(object({
      destination  = string
      attachmentID = string
    }))

  }))
}

# variable "Associations" {
#   description = "Create ER associations in specific ER instance and Route Table"

#   type = map(object({

#     erID         = string
#     routeTableID = string
#     attachmentID = string
#     region       = optional(string, "")

#   }))
# }

