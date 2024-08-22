######################################################################
# output ECS id
######################################################################
output "id" {
  description = "Output ECS id"
  value = {
    for k, v in huaweicloud_compute_instance.this : k => v.id
  }
}
