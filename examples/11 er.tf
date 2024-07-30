module "er" {
  source     = "../11 er"
  depends_on = [module.vpc]

  ERs = {
    "er1" = {
      erAvailabilityZones = ["ap-southeast-2a", "ap-southeast-2c"]
      erName              = "er-1"
      erAsn               = "64512"

      attachments = {
        "attachment1" = {
          attachmentName = "attachment-1"
          vpcID          = module.vpc.vpcIDs["vpc1"]
          subnetID       = module.vpc.subnetIDds["vpc1.subnet1"]
        }
        "attachment2" = {
          attachmentName = "attachment-2"
          vpcID          = module.vpc.vpcIDs["vpc2"]
          subnetID       = module.vpc.subnetIDds["vpc2.subnet1"]
        }
      }

      routeTables = {
        "routeTable1" = {
          routeTableName = "table-1"
        }
        "routeTable2" = {
          routeTableName = "table-2"
        }
      }
    }
  }
}

module "erRouteTables" {
  source     = "../12 erRouteTable"
  depends_on = [module.er]
  routeTables = {

    "routeTable1" = {
      routeTableName = "route-1"
      erID           = module.er.erIDs["er1"]

      associations = {
        "association1" = {
          erID         = module.er.erIDs["er1"]
          attachmentID = module.er.attachmentsIDs["er1.attachment1"]
        }
      }

      propagations = {
        "propation1" = {
          erID         = module.er.erIDs["er1"]
          attachmentID = module.er.attachmentsIDs["er1.attachment1"]
        }
      }
      routes = {
        "route1" = {
          destination  = "0.0.0.0/0"
          attachmentID = module.er.attachmentsIDs["er1.attachment1"]
        }
      }
    }
  }
}
