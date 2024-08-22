######################################################################
# Get the terrform version and Huawei cloud provider version
######################################################################
terraform {
  required_version = ">1.3.0" # Get the latest version of terraform

  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">1.60.0"   # Get the Huawei latest provide
    }
  }
}