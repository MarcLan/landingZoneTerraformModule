# resource "huaweicloud_vpc" "test" {

# }


# variable "vpcs" {
#   description = "VPCs variable"

#   type = map(object({

#     vpc_name    = "testVPC"
#     vpc_cidr    = "192.168.0.0/24"
#     description = optional(string, null)
#     enterprise  = optional(string, "0") # 0 means "default"

#     log_name      = "flowLog"
#     resource_type = "vpc"
#     #resource_id   = string
#     log_group_id  = string
#     log_stream_id = string

#     }
#     )
#   )
# }

# locals {
#   vpcs = {

#     vpc_test = {

#       vpc_name = "infra-prod-vpc-ingress"
#       vpc_cidr = "10.223.88.0/24"

#       flow_logs = {

#         log_name          = "123123132"
#         lts_log_group_id  = "123123"
#         lts_log_stream_id = "12312312123"

#       }

#     }
#   }
# }



# output "test" {
#   value = [for k, v in local.vpcs.vpc_test.vpc_name : v]
# }
