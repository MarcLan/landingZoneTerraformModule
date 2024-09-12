######################################################################
# Get the terrform version and Huawei provider
######################################################################
terraform {
  required_version = ">1.3.0"

  # Get the Huawei latest provide, no need to change the code here
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">1.60.0"
    }
  }
}

######################################################################
# Access key, Secret key and Agency role
######################################################################
provider "huaweicloud" {
  region     = "ap-southeast-2" # The region of Bangkok
  access_key = var.ak
  secret_key = var.sk
}