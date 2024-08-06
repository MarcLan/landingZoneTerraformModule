######################################################################
# Get the terrform version, no need to change the code here
######################################################################

terraform {
  required_version = ">1.3.0"

  # Get the Huawei latest provide, no need to change the code here
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">1.66.3"
    }
  }
}

######################################################################
# Access key and Secret key, no need to change
######################################################################

provider "huaweicloud" {
  region = "ap-southeast-2" # The region ap-bangkok
  access_key = var.access_key
  secret_key = var.secret_key
}
