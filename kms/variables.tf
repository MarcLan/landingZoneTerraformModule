######################################################################
# Variables of KMS
######################################################################
variable "kms" {
  description = "The variables of multiple KMSs"

  type = map(object({

    keyRegion           = optional(string, "ap-southeast-2")
    keyAlias            = string
    keyPendingDays      = optional(string, 7)
    keyIsEnabled        = optional(bool, true)
    keyAlgorithm        = optional(string, "AES_256")
    keyRotationEnabled  = optional(bool, true)
    keyRotationInterval = optional(string, 30)
    keyDescription      = optional(string, "Created by Terraform")

    grants = map(object({
      grantName   = optional(string, "")
      grantRegion = optional(string, "ap-southeast-2")
      # Hong Kong is ap-southease-1

      granteePrincipal = string
      # The ID of the authorized user or account.

      grantOperations = list(string)
      # The operations can be the ones below:
      # create-datakey, create-datakey-without-plaintext, 
      # encrypt-datakey, decrypt-datakey, describe-key, create-grant, 
      # retire-grant, encrypt-data, decrypt-data

      grantType = optional(string, "domain")
      #The options are: user, domain. The default value is use

      grantRetiringPrincipal = optional(string, "")
    }))
  }))
}

