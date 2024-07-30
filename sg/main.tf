######################################################################
# Create Security Group with multiple rules
######################################################################

resource "huaweicloud_networking_secgroup" "this" {
  for_each    = var.sgs
  name        = each.value.name
  description = each.value.description
}

resource "huaweicloud_networking_secgroup_rule" "this" {
  for_each = {
    for rule_value in local.sg_rules : "${rule_value.sg_key}.${rule_value.rule_key}" => rule_value
  }

  security_group_id = each.value.sg_id
  direction         = each.value.direction
  action            = each.value.action
  ethertype         = each.value.ethertype
  ports             = each.value.ports
  protocol          = each.value.protocol
  priority          = each.value.priority
  remote_ip_prefix  = each.value.remote_ip_prefix

}

locals {
  sg_rules = flatten([
    for sg_key, sg_value in var.sgs : [
      for rule_key, rule_value in sg_value.rules : {

        sg_key           = sg_key
        rule_key         = rule_key
        sg_id            = huaweicloud_networking_secgroup.this[sg_key].id
        direction        = rule_value.direction
        action           = rule_value.action
        priority         = rule_value.priority
        ethertype        = rule_value.ethertype
        ports            = rule_value.ports
        remote_ip_prefix = rule_value.remote_ip_prefix
        description      = rule_value.description
        protocol         = rule_value.protocol
        port_range_min   = rule_value.port_range_min
        prot_range_max   = rule_value.prot_range_max

      }
    ]
  ])
}
