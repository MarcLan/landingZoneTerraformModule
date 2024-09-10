######################################################################
# NAT variable
######################################################################
variable "nat" {
  description = "The variables of NAT and NAT Rules"
  type = map(object({

    vpcID    = string
    subnetID = string
    name     = string
    spec     = string
    /**
    1: Small type, which supports up to 10,000 SNAT connections.
    2: Medium type, which supports up to 50,000 SNAT connections.
    3: Large type, which supports up to 200,000 SNAT connections.
    4: Extra-large type, which supports up to 1,000,000 SNAT connections.
    **/
    enterpriseProjectID = optional(string, "0")
    tags                = optional(map(any))
    region              = optional(string, "ap-southeast-2")
    description         = optional(string, "Created by Terraform")

    snats = map(object({
      sourceType   = string # 0 is VPC scenario, 1 is Direct Connect scenario
      eipID        = string
      subnetID     = optional(string, null)
      cidr         = optional(string, null)
      region       = optional(string, "ap-southeast-2")
      natGatewayID = optional(string, "")
      description  = optional(string, "Created by Terraform")
    }))

  }))

}
