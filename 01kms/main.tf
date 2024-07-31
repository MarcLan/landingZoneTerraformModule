######################################################################
# Create KMS
######################################################################
resource "huaweicloud_kms_key" "this" {
  for_each          = var.kms
  key_alias         = each.value.keyAlias
  pending_days      = each.value.keyPendingDays
  is_enabled        = each.value.keyIsEnabled
  key_algorithm     = each.value.keyAlgorithm
  rotation_enabled  = each.value.keyRotationEnabled
  rotation_interval = each.value.keyRotationInterval
}

resource "huaweicloud_kms_grant" "this" {
  for_each = {
    for grantValue in local.kms : "${grantValue.keyKey}.${grantValue.grantKey}" => grantValue
  }
  key_id            = each.value.keyID
  name              = each.value.grantName
  region            = each.value.grantRegion
  grantee_principal = each.value.granteePrincipal
  operations        = each.value.grantOperations
  type              = each.value.grantType
}


# Flat Variables
locals {
  kms = flatten([
    for keyKey, keyValue in var.kms : [
      for grantKey, grantValue in keyValue.grants : {
        keyKey                 = keyKey
        grantKey               = grantKey
        keyID                  = huaweicloud_kms_key.this[keyKey].id
        grantName              = grantValue.grantName
        grantRegion            = grantValue.grantRegion
        granteePrincipal       = grantValue.granteePrincipal
        grantOperations        = grantValue.grantOperations
        grantType              = grantValue.grantType
        grantRetiringPrincipal = grantValue.grantRetiringPrincipal
      }
    ]
  ])
}
