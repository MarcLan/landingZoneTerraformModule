######################################################################
# ECS variables
######################################################################
resource "huaweicloud_compute_instance" "this" {
  for_each           = var.ecs
  region             = each.value.region
  name               = each.value.name
  image_id           = each.value.image
  flavor_id          = each.value.flavor
  security_group_ids = each.value.securityGroupIDs

  system_disk_type = each.value.systemDiskType
  system_disk_size = each.value.systemDiskSize

  # data_disks {
  #   type = each.value.dataDiskType
  #   size = each.value.dataDiskSize
  # }

  network {
    uuid        = each.value.network.subnetID
    fixed_ip_v4 = each.value.network.privateIP
  }
}
