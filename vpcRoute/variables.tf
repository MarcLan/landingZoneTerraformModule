######################################################################
# Route variable
######################################################################

variable "routes" {
  description = "Multiple routes variable"
  default     = {}
  type = map(object({
    vpcID       = string
    destination = string
    type        = string
    #   /** For "route_nexthop" value, check below
    #   If the route type is ecs, the value is an ECS instance ID in the VPC.
    #   If the route type is eni, the value is the extension NIC of an ECS in the VPC.
    #   If the route type is vip, the value is a virtual IP address.
    #   If the route type is nat, the value is a VPN gateway ID.
    #   If the route type is peering, the value is a VPC peering connection ID.
    #   If the route type is vpn, the value is a VPN gateway ID.
    #   If the route type is dc, the value is a Direct Connect gateway ID.
    #   If the route type is cc, the value is a Cloud Connection ID.
    #   If the route type is egw, the value is a VPCEP endpoint ID.
    #   If the route type is er, the value is a ER instance ID.
    #   **/
    #   description = optional(string, "Created by Terraform")
    nexthop     = string
    description = optional(string, "CreatedByTerraform")
  }))
}
