######################################################################
# Create Enterprise Router instance
######################################################################
resource "huaweicloud_er_instance" "this" {
  for_each           = var.ERs
  name               = each.value.erName
  asn                = each.value.erAsn
  availability_zones = each.value.erAvailabilityZones
  description        = "Created by Terraform"
}

######################################################################
# Create ER Attachments
######################################################################
resource "huaweicloud_er_vpc_attachment" "this" {
  for_each = {
    for attachmentValue in local.attachments : "${attachmentValue.erKey}.${attachmentValue.attachmentKey}" => attachmentValue
  }
  name                   = each.value.attachmentName
  instance_id            = each.value.erID
  vpc_id                 = each.value.vpcID
  subnet_id              = each.value.subnetID
  auto_create_vpc_routes = true
  description            = "Created by Terraform"
}


######################################################################
# Flat variables
######################################################################
# Flat Attachments
locals {
  attachments = flatten([
    for erKey, erValue in var.ERs : [
      for attachmentKey, attachmentValue in erValue.attachments : {
        erKey          = erKey
        attachmentKey  = attachmentKey
        erID           = huaweicloud_er_instance.this[erKey].id
        attachmentName = attachmentValue.attachmentName
        vpcID          = attachmentValue.vpcID
        subnetID       = attachmentValue.subnetID
      }
    ]
  ])
}