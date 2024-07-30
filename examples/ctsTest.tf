# module "cts" {
#   source = "../03 cts"
#   cts = {
#     "cts1" = {
#       bucketName = "his-landingzone-cts-data-bucket"
#       tags = {
#         foo = "bar"
#       }
#     }
#   }
# }

# resource "huaweicloud_cts_tracker" "this" {
#   bucket_name = "his-landingzone-cts-data-bucket"
# }

# resource "huaweicloud_cts_tracker" "test" {
#   bucket_name = "his-landingzone-cts-data-bucket-1"
# }
