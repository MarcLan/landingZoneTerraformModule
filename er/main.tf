######################################################################
# Create Enterprise Router instance
######################################################################
resource "huaweicloud_er_instance" "this" {
  for_each                       = var.er
  name                           = each.value.name
  asn                            = each.value.asn
  availability_zones             = each.value.availabilityZones
  auto_accept_shared_attachments = each.value.autoAcceptSharedAttachments
  enable_default_association     = each.value.enableDefaultAssociation
  enable_default_propagation     = each.value.enableDefaultPropagation
  description                    = each.value.description
}

######################################################################
# Create ER Attachments
######################################################################
resource "huaweicloud_er_vpc_attachment" "this" {
  for_each = {
    for attachmentValue in local.attachments : "${attachmentValue.erKey}.${attachmentValue.attachmentKey}" => attachmentValue
  }
  name                   = each.value.name
  instance_id            = each.value.erID
  vpc_id                 = each.value.vpcID
  subnet_id              = each.value.subnetID
  auto_create_vpc_routes = false
  description            = each.value.description
}


######################################################################
# Flat variables
######################################################################
# Flat Attachments
locals {
  attachments = flatten([
    for erKey, erValue in var.er : [
      for attachmentKey, attachmentValue in erValue.attachments : {
        erKey         = erKey
        attachmentKey = attachmentKey
        erID          = huaweicloud_er_instance.this[erKey].id
        name          = attachmentValue.name
        vpcID         = attachmentValue.vpcID
        subnetID      = attachmentValue.subnetID
        description   = attachmentValue.description
      }
    ]
  ])
}
