######################################################################
#  Simple Message Notification variable in map(object({}))
######################################################################
variable "smn" {
  description = "Simple Message Notification variables"
  default     = {}
  type = map(object({

    region      = optional(string, null)
    name        = string
    description = optional(string, "createdByTerraform")

    subscription = map(object({
      region = optional(string, null)
      #topipURN   = string
      protocol = string #  email, sms, http, https, functionstage, functiongraph, callnotify, wechat, dingding, feishu and welink are supported. 
      endpoint = string
    }))
  }))
}
