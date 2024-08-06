module "vpc" {
  source     = "../10vpc"
  depends_on = [module.lts]

  vpc = {

    "vpc1" = {
      vpcName         = "vpc-1"
      vpcCIDR         = "192.168.0.0/16"
      flowLogName     = "flow-log-1"
      flowLogGroupID  = module.lts.groupID["group1"]
      flowLogStreamID = module.lts.streamID["group1.stream1"]

      tags = {
        company     = "awc"
        environment = "production"
        account     = "network"
        role        = "ingress"
      }

      subnets = {

        "subnet1" = {
          subnetName = "subnet-1-1"
          subnetCIDR = "192.168.0.0/24"
        }

        "subnet2" = {
          subnetName = "subnet-1-2"
          subnetCIDR = "192.168.1.0/24"
        }

      }
    }

    "vpc2" = {
      vpcName         = "vpc-2"
      vpcCIDR         = "172.16.0.0/16"
      flowLogName     = "flow-log-1"
      flowLogGroupID  = module.lts.groupID["group2"]
      flowLogStreamID = module.lts.streamID["group2.stream2"]

      tags = {
        foo = "bar"
      }

      subnets = {
        "subnet1" = {
          subnetName = "subnet-2-1"
          subnetCIDR = "172.16.0.0/24"
        }
        "subnet2" = {
          subnetName = "subnet-2-2"
          subnetCIDR = "172.16.1.0/24"
        }
      }
    }
  }
}
