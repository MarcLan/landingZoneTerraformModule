######################################################################
#  Enterprise Router variables
######################################################################
variable "er_route_tables" {
  description = "Created by Terraform"

  type = map(object({

    instance_id = string
    name        = string
    description = "Created by Terraform"

    associations = optional(map(object({
      instance_id   = string
      attachment_id = string
    })))

    propagations = optional(map(object({
      instance_id   = string
      attachment_id = string
        routes = optional(map(object({
      destination   = string
      attachment_id = stringpropagation
    })))








  }))
}
}
