module "nat" {
  source        = "../15 nat"
  depends_on = [module.vpc, module.eip]
  NAT = {
    "nat1" = {
      name     = "nat-1"
      spec     = "1"
      vpcID    = module.vpc.vpcIDs["vpc1"]
      subnetID = module.vpc.subnetIDs["vpc1.subnet1"]
      snats = {
        "snat1" = {
          sourceType = "0"
          eipID      = module.eip.eipIDs["eip1"]
          subnetID   = module.vpc.subnetIDs["vpc1.subnet1"]
        }
      }
    }
  }
}
