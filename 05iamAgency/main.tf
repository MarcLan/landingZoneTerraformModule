######################################################################
# Create Agency Variables
######################################################################
resource "huaweicloud_iam_agency" "this" {
  for_each              = var.iamAgency
  name                  = each.value.name
  delegated_domain_name = each.value.delegatedAccount
#   project_role {
#     project = each.value.projectRoles["project"]
#     roles   = each.value.projectRoles["roles"]
#   }
  domain_roles        = each.value.domainRoles
  all_resources_roles = each.value.allResourcesRoles
}
