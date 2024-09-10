######################################################################
# Create Enterprise Router instance
######################################################################
resource "huaweicloud_er_instance" "this" {
  for_each                       = var.er
  name                           = each.value.erName
  asn                            = each.value.erASN
  availability_zones             = each.value.erAvailabilityZones
  auto_accept_shared_attachments = true
  #description        = "VPC attachment created by terraform"
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
  auto_create_vpc_routes = false
  description            = "VPC attachment created by terraform"
}


######################################################################
# Flat variables
######################################################################
# Flat Attachments
locals {
  attachments = flatten([
    for erKey, erValue in var.er : [
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
