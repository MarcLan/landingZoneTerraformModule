######################################################################
# ECS variables
######################################################################
variable "ecs" {
  type = map(object({
    region           = optional(string, null)
    name             = string
    imageID          = string
    flavorID         = string
    securityGroupIDs = list(string)
    tags             = optional(map(any))

    systemDiskType = string
    /** 
        SAS: High I/O disk type.
        SSD: Ultra-high I/O disk type.
        GPSSD: General purpose SSD disk type.
        ESSD: Extreme SSD type.
        GPSSD2: General purpose SSD V2 type.
        SSD2: Extreme SSD V2 type. 
     **/
    systemDiskSize = number

    dataDiskType = optional(string, null)
    dataDiskSize = optional(number, null)


    network = object({
      subnetID  = string
      privateIP = optional(string, null)
      #   fixedIPv4   = optional(string, null)
      #   ipv6Enabled = optional(bool, false)
    })

  }))
}

