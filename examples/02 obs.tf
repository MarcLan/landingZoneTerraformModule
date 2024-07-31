module "obs" {
  source     = "../02 obs"
  depends_on = [module.kms]
  OBS = {
    "obs1" = {
      bucketName      = "obs-1-hislandingzone"
      multiAZ         = true
      acl             = "private"
      encryption      = "kms"
      kmsKeyID        = module.kms.kmsKeyIDs["kms3"]
    }
  }
}
