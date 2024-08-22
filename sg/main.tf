######################################################################
# Create Security Group with multiple rules
######################################################################

resource "huaweicloud_networking_secgroup" "this" {
  for_each    = var.sg
  name        = each.value.name
  description = each.value.description
}

resource "huaweicloud_networking_secgroup_rule" "this" {
  for_each = {
    for rule_value in local.sg_rules : "${rule_value.sg_key}.${rule_value.rule_key}" => rule_value
  }

  security_group_id = each.value.sgID
  direction         = each.value.direction
  action            = each.value.action
  ethertype         = each.value.ethertype
  ports             = each.value.ports
  protocol          = each.value.protocol
  priority          = each.value.priority
  remote_ip_prefix  = each.value.remoteIpPrefix
  #  remote_address_group_id = each.value.ipGroup

}

locals {
  sg_rules = flatten([
    for sg_key, sg_value in var.sg : [
      for rule_key, rule_value in sg_value.rules : {

        sg_key         = sg_key
        rule_key       = rule_key
        sgID           = huaweicloud_networking_secgroup.this[sg_key].id
        direction      = rule_value.direction
        action         = rule_value.action
        priority       = rule_value.priority
        ethertype      = rule_value.ethertype
        ports          = rule_value.ports
        remoteIpPrefix = rule_value.remoteIpPrefix
        description    = rule_value.description
        protocol       = rule_value.protocol
        portRangeMin   = rule_value.portRangeMin
        protRangeMax   = rule_value.protRangeMax

        # ipGroupName = rule_value.ipGroupName
        # addresses   = rule_value.addresses
        # ipGroup     = huaweicloud_networking_address_group.this[sg_key].id

      }
    ]
  ])
}
