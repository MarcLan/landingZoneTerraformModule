######################################################################
# Create multiple VPCs with multiple subnets
######################################################################
resource "huaweicloud_vpc" "this" {
  for_each              = var.VPCs
  name                  = each.value.vpcName
  cidr                  = each.value.vpcCIDR
  enterprise_project_id = each.value.vpcEnterpriseProject
  tags = each.value.tags
}

######################################################################
# Create multiple Subnets with a specific VPC
######################################################################
resource "huaweicloud_vpc_subnet" "this" {
  for_each = {
    for subnetValue in local.subnets : "${subnetValue.vpcKey}.${subnetValue.subnetKey}" => subnetValue
  }
  name       = each.value.subnetName
  cidr       = each.value.subnetCIDR
  gateway_ip = cidrhost(each.value.subnetCIDR, 1)
  vpc_id     = each.value.vpcID
}

######################################################################
# Create multiple VPC Flow Logs in VPC
######################################################################
resource "huaweicloud_vpc_flow_log" "this" {
  for_each      = var.VPCs
  name          = each.value.flowLogType
  resource_id   = huaweicloud_vpc.this[each.key].id
  resource_type = each.value.flowLogType
  log_group_id  = each.value.flowLogGroupID
  log_stream_id = each.value.flowLogStreamID
}

#####################################################################
#Create VPC Peering
#####################################################################
resource "huaweicloud_vpc_peering_connection" "this" {
  for_each    = var.vpcPeerings
  name        = each.value.name
  vpc_id      = each.value.localVpcID
  peer_vpc_id = each.value.peerVpcID
}

######################################################################
# Flatten([]) takes a list and replaces any elements 
# that are lists with a flattened sequence of the list contents.
######################################################################
locals {
  subnets = flatten([
    for vpcKey, vpcValue in var.VPCs : [
      for subnetKey, subnetValue in vpcValue.subnets : {
        vpcKey     = vpcKey
        subnetKey  = subnetKey
        vpcID      = huaweicloud_vpc.this[vpcKey].id
        subnetCIDR = subnetValue.subnetCIDR
        subnetName = subnetValue.subnetName
      }
    ]
  ])
}
