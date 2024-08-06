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

######################################################################
# Access key and Secret key
######################################################################
provider "huaweicloud" {
  region = "ap-southeast-2" # The region ap-bangkok
  access_key = var.access_key
  secret_key = var.secret_key
}
