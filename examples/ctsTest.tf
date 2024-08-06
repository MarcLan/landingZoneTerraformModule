module "cts" {
  source = "../03cts"
  cts = {
    "cts1" = {
      bucketName          = "test-cts-function"
      organizationEnabled = false # this one needs to be false or you have to enable Organizations>Service>CTS
      tags = {
        foo = "bar"
      }
    }
  }
}

resource "huaweicloud_organizations_trusted_service" "this" {
  service = "service.CTS"
}


resource "huaweicloud_obs_bucket" "this" {
  bucket = "test-cts-function"
}

resource "huaweicloud_cts_tracker" "this" {
  bucket_name = "his-landingzone-cts-data-bucket"
}

resource "huaweicloud_cts_tracker" "test" {
  bucket_name = "his-landingzone-cts-data-bucket-1"
}
