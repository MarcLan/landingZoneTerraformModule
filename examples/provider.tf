######################################################################
# Get the terrform version, no need to change the code here
######################################################################

terraform {
  required_version = ">=1.3.0"

  # Get the Huawei latest provide, no need to change the code here
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">=1.66.3"
    }
  }
}

######################################################################
# Access key and Secret key, no need to change
######################################################################

provider "huaweicloud" {
  region     = "ap-southeast-2" # The region ap-bangkok

  # access_key = "NTI6GCSI7NG8EORBA5IL"
  # secret_key = "dqKM5WwjkVjAn4bFgsdIaSvUNUPblXm9j7KSaG18"

    assume_role {
    agency_name = "terraformRole"
    domain_name = "hwc-awc-core-network"
  }

  access_key = "SGJXXLWDW8E1V4GYQI73"
  secret_key = "pR03dkNMUI0XS21cmXH6dj9mEWP4RZlH52VMAO3q"
}
