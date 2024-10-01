######################################################################
# output ECS id
######################################################################
output "id" {
  description = "Output ECS id"
  value = {
    for k, v in huaweicloud_compute_instance.this : k => v.id
  }
}

output "privateIP" {
  description = "Output ECS private IP"
  value = {
    for k, v in huaweicloud_compute_instance.this : k => v.network[0].fixed_ip_v4
  }
}

