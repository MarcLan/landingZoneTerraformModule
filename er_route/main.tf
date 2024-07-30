######################################################################
# Create Enterprise Router instance
######################################################################

resource "huaweicloud_er_instance" "this" {
  for_each           = var.er
  name               = each.value.er_name
  asn                = each.value.asn
  availability_zones = each.value.availability_zones
  description        = "Created by Terraform"
}

resource "huaweicloud_er_vpc_attachment" "this" {
  for_each = {
    for attachment_value in local.er_attachments : "${attachment_value.er_key}.${attachment_value.attachment_key}" => attachment_value
  }
  name                   = each.value.attachment_name
  instance_id            = each.value.er_id
  vpc_id                 = each.value.vpc_id
  subnet_id              = each.value.subnet_id
  auto_create_vpc_routes = true
  description            = "Created by Terraform"
}

locals {
  er_attachments = flatten([
    for er_key, er_value in var.er : [
      for attachment_key, attachment_value in er_value.attachments : {
        er_key          = er_key
        attachment_key  = attachment_key
        er_id           = huaweicloud_er_instance.this[er_key].id
        attachment_name = attachment_value.attachment_name
        vpc_id          = attachment_value.vpc_id
        subnet_id       = attachment_value.subnet_id

      }
    ]
  ])
}
