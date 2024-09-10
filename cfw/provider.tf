######################################################################
# Get the terrform version, no need to change the code here
######################################################################
terraform {
  required_version = ">=1.3.0"
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">=1.60.0"
    }
  }
}