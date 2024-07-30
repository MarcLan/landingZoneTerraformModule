######################################################################
# NAT variable
######################################################################
variable "nat" {
  description = "The variables of NAT and NAT Rules"
  type = map(object({

    region = optional(string, "ap-southeast-2")
    vpcID  = string
    name   = string
    spec   = string
    /**
    1: Small type, which supports up to 10,000 SNAT connections.
    2: Medium type, which supports up to 50,000 SNAT connections.
    3: Large type, which supports up to 200,000 SNAT connections.
    4: Extra-large type, which supports up to 1,000,000 SNAT connections.
    **/
    description         = optional(string, "Created by Terraform")
    ip                  = optional(string, "")
    enterpriseProjectID = optional(string, "0")
    tags                = map(any)

    snatRules = map(object({
      region       = optional(string, "ap-southeast-2")
      natGatewayID = optional(string, "")
      sourceType   = optional(string, "0") # 0 is VPC scenario, 1 is Direct Connect scenario
      subnetID     = optional(string, "")
      cidr         = optional(string, "")
      description  = optional(string, "Created by Terraform")

    }))

  }))

}
