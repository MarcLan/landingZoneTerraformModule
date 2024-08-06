######################################################################
# RAM Variables
######################################################################
variable "ram" {
  description = "ram variables"
  type = map(object({
    name = string
    urns = list(any)
    destinationAccountIDs = list(any)
  }))
}