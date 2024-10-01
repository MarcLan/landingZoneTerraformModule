######################################################################
# ECS variables
######################################################################
variable "ecs" {
  type = map(object({
    region           = optional(string, null)
    name             = string
    image            = string
    flavor           = string
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
    kmsSystemDisk  = optional(string, null)

    dataDisk = optional(object({
      dataDiskType = string
      dataDiskSize = number
      kms          = string
    }), null)

    network = object({
      subnetID  = string
      privateIP = optional(string, null)
      #   fixedIPv4   = optional(string, null)
      #   ipv6Enabled = optional(bool, false)
    })

  }))

  default = {
    example_instance = {
      region           = null # You can change to a region of your choice
      name             = null
      image            = null
      flavor           = null
      securityGroupIDs = null

      systemDiskType = null
      systemDiskSize = null
      kmsSystemDisk  = null

      dataDisk = {
        dataDiskType = null
        dataDiskSize = null
        kms          = null
      }

      network = {
        subnetID  = null
        privateIP = null
      }
    }
  }

}

