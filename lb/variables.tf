######################################################################
# ELB Variables
######################################################################
variable "elb" {
  description = "elb variables"
  type = map(object({
    description         = optional(string, "createdByTerraform")
    region              = optional(string, null)
    name                = string
    subnetID            = string
    address             = optional(string, null)
    tags                = optional(map(any))
    enterpriseProjectID = optional(string, null)
  }))
}
