# How to Call CFW Module

CFW: Cloud Firewall, use CFW module to deploy CFW instance



## Modules

*Modules* are containers for multiple resources that are used together. A module consists of a collection of `.tf` and/or `.tf.json` files kept together in a directory.

Modules are the main way to package and reuse resource configurations with Terraform.

For more: https://developer.hashicorp.com/terraform/language/modules#using-modules



## Files

Check https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs to how to use Huawei cloud Terraform provider

- ### provider.tf

  Get Huawei Terraform Provider which has `source` and `version`

  ```python
  terraform {
    required_version = ">=1.3.0" # Get Terraform version
    required_providers {
      huaweicloud = {
        source  = "huaweicloud/huaweicloud" # Get huawei cloud provider
        version = ">=1.60.0" # 1.63 currently
      }
    }
  }		
  ```

  

- ### variables.tf

  Customize the input variables 

  ```python
  variable "name" { type = string }
  variable "east_west_firewall_inspection_cidr" { type = string }
  variable "east_west_firewall_er_id" { type = string }
  variable "flavor" { type = string }	
  ```

  

- ### main.tf

  It has the logic of the code

  ```python
  resource "huaweicloud_cfw_firewall" "this" {
    name                               = var.name
    east_west_firewall_er_id           = var.east_west_firewall_er_id
    east_west_firewall_inspection_cidr = var.east_west_firewall_inspection_cidr
    flavor {
      version = var.flavor
    }
  }
  ```

  

- ### outputs.tf

  ##### Define what information should be output for other resource to use: `CFW ID`

  ```python
  output "cfw" {
    description = "Output CFW ID"
    value = {
      for k, v in huaweicloud_cfw_firewall : k => v.id 
    }
  }	
  ```

  ###

  Go to `../examples/cfw.tf` to check the simple code to call CFW module

  ```python
  module "cfw" {
    source = "../cfw"
    cfw = {
      name                               = "cfwTest"
      flavor                             = "Professional"
      east_west_firewall_er_id           = ""
      east_west_firewall_inspection_cidr = ""
      east_west_firewall_mode            = ""
    }
  }
  
  ```

  

- ### README.md

  This file

  

## How to Call

### Folder Structure

- cfw
  - main.tf
  - outputs.tf
  - provider.tf
  - variables.tf
- examples
  - cfw.tf
  - provider.tf
  - variables.tf

### Add Code

Go to `examples` folder > Create file `cfw.tf` > Add code below in the file, the arguments can be changed

```python
module "cfw" {
  source = "../cfw"
  cfw = {
    name                               = "cfwTest"
    flavor                             = "Professional"
    east_west_firewall_er_id           = ""
    east_west_firewall_inspection_cidr = ""
    east_west_firewall_mode            = ""
  }
}
```

###  Deployment

- Run `terraform init` in the `examples` folder

  ```shell
  [root@terraformuab examples]# terraform init
  Initializing the backend...
  Initializing modules...
  Initializing provider plugins...
  - Reusing previous version of huaweicloud/huaweicloud from the dependency lock file
  - Using previously-installed huaweicloud/huaweicloud v1.68.1
  
  Terraform has been successfully initialized!
  
  You may now begin working with Terraform. Try running "terraform plan" to see
  any changes that are required for your infrastructure. All Terraform commands
  should now work.
  
  If you ever set or change modules or backend configuration for Terraform,
  rerun this command to reinitialize your working directory. If you forget, other
  commands will detect it and remind you to do so if necessary.
  ```

- Run `terraform apply`

  ```shell
  [root@terraformuab examples]# terraform apply
  
  Terraform used the selected providers to generate the following execution plan. Resource actions are
  indicated with the following symbols:
    + create
  
  Terraform will perform the following actions:
  
    # module.cfw.huaweicloud_cfw_firewall.this will be created
    + resource "huaweicloud_cfw_firewall" "this" {
        + charging_mode                        = "postPaid"
        + east_west_firewall_er_attachment_id  = (known after apply)
        + east_west_firewall_er_id             = (known after apply)
        + east_west_firewall_inspection_cidr   = (known after apply)
        + east_west_firewall_inspection_vpc_id = (known after apply)
        + east_west_firewall_mode              = (known after apply)
        + engine_type                          = (known after apply)
        + enterprise_project_id                = (known after apply)
        + ha_type                              = (known after apply)
        + id                                   = (known after apply)
        + name                                 = "cfwTest"
        + protect_objects                      = (known after apply)
        + region                               = (known after apply)
        + service_type                         = (known after apply)
        + status                               = (known after apply)
        + support_ipv6                         = (known after apply)
  
        + flavor {
            + bandwidth           = (known after apply)
            + default_bandwidth   = (known after apply)
            + default_eip_count   = (known after apply)
            + default_log_storage = (known after apply)
            + default_vpc_count   = (known after apply)
            + eip_count           = (known after apply)
            + log_storage         = (known after apply)
            + total_rule_count    = (known after apply)
            + used_rule_count     = (known after apply)
            + version             = "Professional"
            + vpc_bandwidth       = (known after apply)
            + vpc_count           = (known after apply)
          }
      }
  
  Plan: 1 to add, 0 to change, 0 to destroy.
  
  Do you want to perform these actions?
    Terraform will perform the actions described above.
    Only 'yes' will be accepted to approve.
  
    Enter a value: 
  ```

- Enter `yes`

  ```shell
    Enter a value: yes
  
  module.cfw.huaweicloud_cfw_firewall.this: Creating...
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [10s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [20s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [30s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [40s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [50s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [1m0s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [1m10s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [1m20s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [1m30s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [1m40s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [1m50s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [2m0s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [2m10s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [2m20s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [2m30s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [2m40s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [2m50s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [3m0s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [3m10s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [3m20s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [3m30s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [3m40s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [3m50s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [4m0s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [4m10s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [4m20s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [4m30s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [4m40s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [4m50s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [5m0s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Still creating... [5m10s elapsed]
  module.cfw.huaweicloud_cfw_firewall.this: Creation complete after 5m18s [id=7c089972-bbeb-4188-9add-73af56b07723]
  
  Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
  ```

- see the last line above, it shows `1 added` which means the CFW created successfully

  ```shell
  Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
  ```



## To be Done

- [huaweicloud_cfw_firewall](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/cfw_firewall)
  - engine_type
  - ha_type
- [huaweicloud_cfw_eip_protection](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/cfw_eip_protection)
- [huaweicloud_cfw_lts_log](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/cfw_lts_log)
- [huaweicloud_cfw_protection_rule](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/cfw_protection_rule)