######################################################################
# CTS Notification variables
######################################################################
variable "notification" {
  description = "The variables of cts notification"
  type = map(object({

    region        = optional(string, null)
    name          = optional(string, null)
    operationType = optional(string, "complete") # complete, customized
    smnTopic      = optional(string, null)

    operationService  = string
    operationResource = string
    operationName     = list(string)

    # operationUsersGroup = list(string)
    # operationUsers      = list(string)

  }))
}
