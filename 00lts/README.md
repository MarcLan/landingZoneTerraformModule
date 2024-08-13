# LTS (Log Tank Service) Module

How to use LTS (Log Tank Service) module

How to install Terraform: https://developer.hashicorp.com/terraform/install

## Files

- **main.tf**: the core code
- **provider.tf**: to get Huawei cloud Provider from Terraform Registry
- **variables.tf**: the inputs
- **outputs.tf**: the outputs
- **README.md**: this file

## How to call this module

- You can create multiple LTS Groups with multiple LTS Streams in each Group 

  ```
  - group 1
  	- stream 1-1
      - stream 1-2
      - stream 1-3
      - stream ...
  - group 2
  	- stream 2-1
  	- stream 2-2
  	- stream 2-3
  - group 3
  - group 4
  - group ...1Lydia7142325@
  ```



- Get ready

  - Create Access Key and Secret Key: https://support.huaweicloud.com/intl/en-us/iam_faq/iam_01_0618.html

  - (Optional) Create Agency: https://support.huaweicloud.com/intl/en-us/usermanual-iam/iam_06_0004.html 

  - Copy this module folder "/modules/00lts" to your environment

    

- Create **provider.tf**

  ```python
  terraform {
    required_version = ">1.3.0" # Alwasy get the latest version of terraform
  
    required_providers {
      huaweicloud = {
        source  = "huaweicloud/huaweicloud"
        version = ">1.60.0" # Get the Huawei latest provide
      }
    }
  }
  
  provider "huaweicloud" {
    region = "ap-southeast-2" # The Bangkok region
    access_key = var.access_key # Your access key
    secret_key = var.secret_key # Your secret key
      
    # assume_role is optional only if you use IAM Agency to swich role to other accounts
    assume_role {
      agency_name = "terraformRole" # The Agency name
      domain_name = "hwc_kbank_lcs_nonprod" # The account you want to access
    }
      
  }
  ```

  

- Create **lts.tf**, check the example in ../example/00lts.tf

  ```python
  module "lts" { # Define the module name
    source = "../00lts" # The path of the module folder
      
    # Multiple groups
    lts = {
        
  	# First group
      "group1" = { 		
        groupName = "group-1"
        groupTTL  = 30
          
        # Multiple streams in the first group
        streams = {  
            
          # First stream
          "stream1" = { 
            streamName = "stream-1"
          }
            
          # Second stream
          "stream2" = { 
            streamName = "stream-2"
          }
            
        }
      }
  
      # Second group
      "group2" = {
        groupName = "group-2"
        groupTTL  = 30
          
        # Multiple streams in the second group
        streams = {
            
          # First stream in the second group
          "stream1" = {
            streamName = "stream-1"
          }
            
          # First stream in the second group
          "stream2" = {
            streamName = "stream-2"
          }
            
        }
          
      }
  
    }
      
  }
  ```

  

- Run Terraform command

  - **terraform plan**, show you the what Terraform is going to do

    ```shell
    # terraform plan
    # module.lts.huaweicloud_lts_group.this["group1"] will be created
      + resource "huaweicloud_lts_group" "this" {
          + created_at  = (known after apply)
          + group_name  = "group-1"
          + id          = (known after apply)
          + region      = (known after apply)
          + ttl_in_days = 30
        }
    
      # module.lts.huaweicloud_lts_group.this["group2"] will be created
      + resource "huaweicloud_lts_group" "this" {
          + created_at  = (known after apply)
          + group_name  = "group-2"
          + id          = (known after apply)
          + region      = (known after apply)
          + ttl_in_days = 30
        }
    ```

  - **terraform apply**, terraform does the moves based on your code

    ```shell
    # terraform apply
    # module.lts.huaweicloud_lts_group.this["group1"] will be created
      + resource "huaweicloud_lts_group" "this" {
          + created_at  = (known after apply)
          + group_name  = "group-1"
          + id          = (known after apply)
          + region      = (known after apply)
          + ttl_in_days = 30
        }
    
      # module.lts.huaweicloud_lts_group.this["group2"] will be created
      + resource "huaweicloud_lts_group" "this" {
          + created_at  = (known after apply)
          + group_name  = "group-2"
          + id          = (known after apply)
          + region      = (known after apply)
          + ttl_in_days = 30
        }
        
      Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.
    
      Enter a value: yes
    ```

- Check Huawei cloud console to see if the Terraform moves are done or not

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >1.3.0 |
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | >1.60.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | >1.60.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [huaweicloud_lts_group.this](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/lts_group) | resource |
| [huaweicloud_lts_stream.this](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/lts_stream) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lts"></a> [lts](#input\_lts) | lts variables | <pre>map(object({<br><br>    groupName = string<br>    groupTTL = string<br><br>    streams = optional(map(object({<br>      streamName = string<br><br>    }))) <br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_groupID"></a> [groupID](#output\_groupID) | Output Log Tank Service Groups ID |
| <a name="output_streamID"></a> [streamID](#output\_streamID) | Output Log Tank Service Steams ID |
