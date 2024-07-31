######################################################################
# Groups and Streams varialbe in map(object({}))
######################################################################

variable "lts" {
  description = "lts variables"

  type = map(object({

    groupName = string
    groupTTL = string

    streams = optional(map(object({
      streamName = string

    }))) 
  }))
}