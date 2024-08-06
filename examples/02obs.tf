module "obs" {
  source     = "../02obs"
  depends_on = [module.kms]
  obs = {
    "obs1" = {
      bucketName      = "obs-1-hislandingzone"
      multiAZ         = true
      acl             = "private"
      encryption      = "kms"
      kmsKeyID        = module.kms.kmsKeyIDs["kms4"]
    }
  }
}
