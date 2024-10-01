######################################################################
# Create ECS
######################################################################
resource "huaweicloud_compute_instance" "this" {
  # lifecycle {
  #   ignore_changes = [data_disks]
  # }
  for_each               = var.ecs
  region                 = each.value.region
  name                   = each.value.name
  image_id               = each.value.image
  flavor_id              = each.value.flavor
  security_group_ids     = each.value.securityGroupIDs
  system_disk_kms_key_id = each.value.kmsSystemDisk

  system_disk_type = each.value.systemDiskType
  system_disk_size = each.value.systemDiskSize

  # Conditionally include dataDisk only if it's provided (not null)
  dynamic "data_disks" {
    for_each = each.value.dataDisk != null ? [each.value.dataDisk] : []
    content {
      type       = data_disks.value.dataDiskType
      size       = data_disks.value.dataDiskSize
      kms_key_id = data_disks.value.kms
    }
  }

  # data_disks {
  #   type       = each.value.dataDisk.dataDiskType
  #   size       = each.value.dataDisk.dataDiskSize
  #   kms_key_id = each.value.dataDisk.kms
  # }

  network {
    uuid        = each.value.network.subnetID
    fixed_ip_v4 = each.value.network.privateIP
  }

}
