######################################################################
# Out put VPCs IDs for other resources
###################################################################### 
output "vpcIDs" {
  description = "Out put VPCs IDs for other resources"
  value = {
    for k, v in huaweicloud_vpc.this : k => v.id
  }
}

output "vpcCIDR" {
  description = "Out put VPCs IDs for other resources"
  value = {
    for k, v in huaweicloud_vpc.this : k => v.cidr
  }
}

output "subnetIDds" {
  description = "Out put subnets IDs for other resources"
  value = {
    for k, v in huaweicloud_vpc_subnet.this : k => v.id
  }
}

output "vpcPeeringIDs" {
  description = "Out put VPC Peering IDs for other resources"
  value = {
    for k, v in huaweicloud_vpc_peering_connection.this : k => v.id
  }
}
