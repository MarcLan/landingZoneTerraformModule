######################################################################
# VPCs and subnets variable in map(object({}))
######################################################################
variable "VPCs" {
  description = "VPCs variables"

  type = map(object({

    vpcName              = string
    vpcCIDR              = string
    vpcDescription       = optional(string, "created by Terraform")
    vpcEnterpriseProject = optional(string, "") # Empty means the Default project

    flowLogName          = optional(string, "")
    flowLogType          = optional(string, "vpc")
    flowLogFilterTraffic = optional(string, "all")
    flowLogGroupID       = optional(string, "")
    flowLogStreamID      = optional(string, "")
    tags                 = map(any)

    subnets = map(object({
      subnetName        = string
      subnetCIDR        = string
      subnetDescription = optional(string, "Created by Terraform")
    }))

  }))
}

######################################################################
# VPC Peering variable
######################################################################
variable "vpcPeerings" {
  description = "VPC peerings variable"
  default     = {}
  type = map(object({

    peeringName = string
    locaVpcID   = string
    peerVpcID   = string

  }))
}
