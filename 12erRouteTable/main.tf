
######################################################################
# Create Enterprise Router Tables
######################################################################
resource "huaweicloud_er_route_table" "this" {
  for_each    = var.routeTables
  name        = each.value.routeTableName
  instance_id = each.value.erID
}

######################################################################
# Create Enterprise Router Association
######################################################################
resource "huaweicloud_er_association" "this" {
  for_each = {
    for associationValue in local.associations : "${associationValue.routeTableKey}.${associationValue.associationKey}" => associationValue
  }
  instance_id    = each.value.erID
  route_table_id = each.value.routeTableID
  attachment_id  = each.value.attachmentID
}

######################################################################
# Create Enterprise Router Propagation
######################################################################
resource "huaweicloud_er_propagation" "this" {
  for_each = {
    for propagationValue in local.propagations : "${propagationValue.routeTableKey}.${propagationValue.propagationKey}" => propagationValue
  }
  instance_id    = each.value.erID
  route_table_id = each.value.routeTableID
  attachment_id  = each.value.attachmentID
}

######################################################################
# Create Enterprise Router Routes
######################################################################
resource "huaweicloud_er_static_route" "this" {
  for_each = {
    for routeValue in local.routes : "${routeValue.routeTableKey}.${routeValue.routeKey}" => routeValue
  }
  route_table_id = each.value.routeTableID
  destination    = each.value.destination
  attachment_id  = each.value.attachmentID
}

# ######################################################################
# # Flat variables
# ######################################################################

# Flat Associations
locals {
  associations = flatten([
    for routeTableKey, routeTableValue in var.routeTables : [
      for associationKey, associationValue in routeTableValue.associations : {
        routeTableKey  = routeTableKey
        associationKey = associationKey
        routeTableID   = huaweicloud_er_route_table.this[routeTableKey].id
        erID           = associationValue.erID
        attachmentID   = associationValue.attachmentID
      }
    ]
  ])
}

# Flat Propagations
locals {
  propagations = flatten([
    for routeTableKey, routeTableValue in var.routeTables : [
      for propagationKey, propagationValue in routeTableValue.propagations : {
        routeTableKey  = routeTableKey
        propagationKey = propagationKey
        routeTableID   = huaweicloud_er_route_table.this[routeTableKey].id
        erID           = propagationValue.erID
        attachmentID   = propagationValue.attachmentID
      }
    ]
  ])
}

# Flat Routes
locals {
  routes = flatten([
    for routeTableKey, routeTableValue in var.routeTables : [
      for routeKey, routeValue in routeTableValue.routes : {
        routeTableKey = routeTableKey
        routeKey      = routeKey
        routeTableID  = huaweicloud_er_route_table.this[routeTableKey].id
        destination   = routeValue.destination
        attachmentID  = routeValue.attachmentID
      }
    ]
  ])
}
