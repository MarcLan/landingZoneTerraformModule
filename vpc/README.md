# Huawei Cloud VPC Terraform Module

## Introduction

This Terraform module helps you create and manage Virtual Private Clouds (VPCs) on Huawei Cloud. With this module, you can:

- Create multiple VPCs with custom settings.
- Add multiple subnets to each VPC.
- Enable VPC Flow Logs for monitoring network traffic.
- Set up VPC Peering connections between VPCs.

This module simplifies managing your network infrastructure on Huawei Cloud using Terraform.

## Module Files Explanation

| File           | Description                                                  |
| -------------- | ------------------------------------------------------------ |
| `provider.tf`  | Specifies the required Terraform and Huawei Cloud provider versions. No changes needed here. |
| `variables.tf` | Defines input variables to customize VPCs, subnets, and VPC peerings. |
| `main.tf`      | Contains the main Terraform code to create VPCs, subnets, flow logs, and peering connections. |
| `outputs.tf`   | Defines outputs like VPC IDs and Subnet IDs for use in other parts of your configuration. |

## How the Code Works

### `provider.tf`

- Ensures you are using Terraform version greater than `1.3.0`.
- Requires the Huawei Cloud provider version greater than `1.60.0`.

### `variables.tf`

Defines two main variables:

#### `vpc`

A map of VPC configurations:

| Key                    | Type                  | Description                                                  |
| ---------------------- | --------------------- | ------------------------------------------------------------ |
| `vpcName`              | `string`              | Name of the VPC.                                             |
| `vpcCIDR`              | `string`              | CIDR block for the VPC (e.g., `"192.168.0.0/16"`).           |
| `vpcDescription`       | `string` (optional)   | Description of the VPC. Default: `"created by Terraform"`.   |
| `vpcEnterpriseProject` | `string` (optional)   | Enterprise project ID. Leave empty (`""`) for the default project. |
| `flowLogName`          | `string` (optional)   | Name for the VPC Flow Log.                                   |
| `flowLogType`          | `string` (optional)   | Type of flow log resource. Default: `"vpc"`.                 |
| `flowLogFilterTraffic` | `string` (optional)   | Type of traffic to log. Default: `"all"`.                    |
| `flowLogGroupID`       | `string` (optional)   | Log group ID for flow logs.                                  |
| `flowLogStreamID`      | `string` (optional)   | Log stream ID for flow logs.                                 |
| `tags`                 | `map(any)` (optional) | Map of tags to assign to the VPC.                            |
| `subnets`              | `map(object)`         | Map of subnets within the VPC.                               |

Each subnet object inside `subnets`:

| Key                 | Type                | Description                                                  |
| ------------------- | ------------------- | ------------------------------------------------------------ |
| `subnetName`        | `string`            | Name of the subnet.                                          |
| `subnetCIDR`        | `string`            | CIDR block for the subnet (e.g., `"192.168.1.0/24"`).        |
| `subnetDescription` | `string` (optional) | Description of the subnet. Default: `"Created by Terraform"`. |

#### `vpcPeerings`

A map of VPC peering configurations:

| Key           | Type     | Description                     |
| ------------- | -------- | ------------------------------- |
| `peeringName` | `string` | Name of the peering connection. |
| `localVpcID`  | `string` | ID of the local VPC.            |
| `peerVpcID`   | `string` | ID of the peer VPC.             |

### `main.tf`

Contains the main Terraform code to create the resources. Here's a detailed explanation:

#### Resources

| Resource                                  | Purpose                                                      |
| ----------------------------------------- | ------------------------------------------------------------ |
| `huaweicloud_vpc.this`                    | Creates multiple VPCs based on the `vpc` variable.           |
| `huaweicloud_vpc_subnet.this`             | Creates multiple subnets within the VPCs.                    |
| `huaweicloud_vpc_flow_log.this`           | Creates VPC Flow Logs for monitoring network traffic in the VPCs. |
| `huaweicloud_vpc_peering_connection.this` | Creates VPC peering connections between specified VPCs.      |

#### `huaweicloud_vpc.this`

- **Purpose**: Creates multiple VPCs.

- **Looping**: Uses `for_each` over `var.vpc` to create a VPC for each entry.

- **Important Attributes**:

  | Attribute               | Description                                                |
  | ----------------------- | ---------------------------------------------------------- |
  | `for_each`              | Iterates over each VPC defined in `var.vpc`.               |
  | `name`                  | The name of the VPC (`each.value.vpcName`).                |
  | `cidr`                  | The CIDR block for the VPC (`each.value.vpcCIDR`).         |
  | `enterprise_project_id` | Enterprise project ID (`each.value.vpcEnterpriseProject`). |
  | `tags`                  | Tags for the VPC (`each.value.tags`).                      |

#### `huaweicloud_vpc_subnet.this`

- **Purpose**: Creates multiple subnets within each VPC.

- **Looping**: Uses `for_each` over `local.subnets`, which is a flattened list of subnets.

- **Depends On**: `huaweicloud_vpc.this` to ensure VPCs are created first.

- **Important Attributes**:

  | Attribute    | Description                                                  |
  | ------------ | ------------------------------------------------------------ |
  | `for_each`   | Iterates over each subnet in `local.subnets`.                |
  | `name`       | The name of the subnet (`each.value.subnetName`).            |
  | `cidr`       | The CIDR block for the subnet (`each.value.subnetCIDR`).     |
  | `gateway_ip` | The gateway IP, calculated as the first IP in the subnet CIDR. |
  | `vpc_id`     | The ID of the VPC where the subnet is created (`each.value.vpcID`). |

#### `huaweicloud_vpc_flow_log.this`

- **Purpose**: Creates VPC Flow Logs to monitor network traffic.

- **Looping**: Uses `for_each` over `var.vpc` to create flow logs for each VPC.

- **Depends On**: `huaweicloud_vpc.this`.

- **Important Attributes**:

  | Attribute       | Description                                                  |
  | --------------- | ------------------------------------------------------------ |
  | `for_each`      | Iterates over each VPC in `var.vpc`.                         |
  | `name`          | The name of the flow log (`each.value.flowLogName`).         |
  | `resource_id`   | The ID of the VPC (`huaweicloud_vpc.this[each.key].id`).     |
  | `resource_type` | The type of resource to monitor (`each.value.flowLogType`).  |
  | `log_group_id`  | The ID of the Log Tank Service (LTS) log group (`each.value.flowLogGroupID`). |
  | `log_stream_id` | The ID of the LTS log stream (`each.value.flowLogStreamID`). |

#### `huaweicloud_vpc_peering_connection.this`

- **Purpose**: Creates VPC peering connections.

- **Looping**: Uses `for_each` over `var.vpcPeerings`.

- **Important Attributes**:

  | Attribute     | Description                                                  |
  | ------------- | ------------------------------------------------------------ |
  | `for_each`    | Iterates over each peering in `var.vpcPeerings`.             |
  | `name`        | The name of the peering connection (`each.value.peeringName`). |
  | `vpc_id`      | The ID of the local VPC (`each.value.localVpcID`).           |
  | `peer_vpc_id` | The ID of the peer VPC (`each.value.peerVpcID`).             |

#### `locals` Block

- **Purpose**: Flattens the nested `subnets` map into a list for easier looping.
- **Explanation**:
  - Uses nested loops to iterate over each VPC and its subnets.
  - Creates a flattened list of subnets with associated VPC IDs.

### `outputs.tf`

Defines outputs that provide useful information:

| Output         | Description                                         |
| -------------- | --------------------------------------------------- |
| `vpcID`        | Map of VPC names to their IDs.                      |
| `vpcCIDR`      | Map of VPC names to their CIDR blocks.              |
| `subnetID`     | Map of subnet identifiers to their IDs.             |
| `ipv4SubnetID` | Map of subnet identifiers to their IPv4 subnet IDs. |
| `vpcPeeringID` | Map of VPC peering names to their IDs.              |

## Usage Example

Here is how you can use this module in your Terraform configuration:

```
hclCopy codemodule "vpc" {
  source = "../modules/vpc"  # Update the path to your module

  vpc = {
    "vpc1" = {
      vpcName              = "my-vpc-1"
      vpcCIDR              = "192.168.0.0/16"
      vpcDescription       = "My first VPC"
      vpcEnterpriseProject = ""  # Default project
      flowLogName          = "vpc1-flow-log"
      flowLogGroupID       = "your-log-group-id"   # Replace with your log group ID
      flowLogStreamID      = "your-log-stream-id"  # Replace with your log stream ID
      tags = {
        Environment = "Dev"
      }
      subnets = {
        "subnet1" = {
          subnetName        = "subnet-1"
          subnetCIDR        = "192.168.1.0/24"
          subnetDescription = "First subnet in VPC 1"
        },
        "subnet2" = {
          subnetName        = "subnet-2"
          subnetCIDR        = "192.168.2.0/24"
          subnetDescription = "Second subnet in VPC 1"
        }
      }
    },
    "vpc2" = {
      vpcName              = "my-vpc-2"
      vpcCIDR              = "10.0.0.0/16"
      vpcDescription       = "My second VPC"
      vpcEnterpriseProject = ""  # Default project
      flowLogName          = "vpc2-flow-log"
      flowLogGroupID       = "your-log-group-id"   # Replace with your log group ID
      flowLogStreamID      = "your-log-stream-id"  # Replace with your log stream ID
      tags = {
        Environment = "Prod"
      }
      subnets = {
        "subnet1" = {
          subnetName        = "subnet-1"
          subnetCIDR        = "10.0.1.0/24"
          subnetDescription = "First subnet in VPC 2"
        }
      }
    }
  }

  vpcPeerings = {
    "peering1" = {
      peeringName = "vpc1-to-vpc2"
      localVpcID  = module.vpc.vpcID["vpc1"]  # Get VPC ID from module outputs
      peerVpcID   = module.vpc.vpcID["vpc2"]
    }
  }
}
```

**Tips**:

- Replace `"your-log-group-id"` and `"your-log-stream-id"` with your actual Log Tank Service (LTS) IDs.
- Ensure the `source` path points to where your module is saved.
- Use the outputs like `module.vpc.vpcID` to reference created resources.

## Running the Example

To run this example, follow these steps:

1. **Initialize Terraform**:

   ```
   bash
   
   
   Copy code
   terraform init
   ```

2. **Validate the Configuration**:

   ```
   bash
   
   
   Copy code
   terraform validate
   ```

3. **Preview the Changes (Optional)**:

   ```
   bash
   
   
   Copy code
   terraform plan
   ```

4. **Apply the Configuration**:

   ```
   bash
   
   
   Copy code
   terraform apply
   ```

   When prompted, type `yes` to confirm.

**Sample Output**:

```
bashCopy code$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding huaweicloud/huaweicloud versions matching ">1.60.0"...
- Installing huaweicloud/huaweicloud v1.60.1...
- Installed huaweicloud/huaweicloud v1.60.1 (signed by a HashiCorp partner, key ID XXXXXXXXXXXXXXXXX)

Terraform has been successfully initialized!

$ terraform validate

Success! The configuration is valid.

$ terraform plan

Terraform will perform the following actions:

  # module.vpc.huaweicloud_vpc.this["vpc1"] will be created
  + resource "huaweicloud_vpc" "this" {
      + cidr                  = "192.168.0.0/16"
      + enterprise_project_id = (known after apply)
      + id                    = (known after apply)
      + name                  = "my-vpc-1"
      + region                = (known after apply)
      + status                = (known after apply)
      + tags                  = {
          + "Environment" = "Dev"
        }
    }

  # module.vpc.huaweicloud_vpc.this["vpc2"] will be created
  + resource "huaweicloud_vpc" "this" {
      + cidr                  = "10.0.0.0/16"
      + enterprise_project_id = (known after apply)
      + id                    = (known after apply)
      + name                  = "my-vpc-2"
      + region                = (known after apply)
      + status                = (known after apply)
      + tags                  = {
          + "Environment" = "Prod"
        }
    }

  # module.vpc.huaweicloud_vpc_subnet.this["vpc1.subnet1"] will be created
  + resource "huaweicloud_vpc_subnet" "this" {
      + cidr           = "192.168.1.0/24"
      + gateway_ip     = "192.168.1.1"
      + id             = (known after apply)
      + name           = "subnet-1"
      + region         = (known after apply)
      + status         = (known after apply)
      + vpc_id         = (known after apply)
    }

  # ... (Other resources like additional subnets, flow logs, and peering connections)

Plan: 6 to add, 0 to change, 0 to destroy.

$ terraform apply

Terraform will perform the following actions:

  # ... (Same as plan output)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.vpc.huaweicloud_vpc.this["vpc1"]: Creating...
module.vpc.huaweicloud_vpc.this["vpc2"]: Creating...
module.vpc.huaweicloud_vpc.this["vpc1"]: Creation complete after 2s [id=xxx-xxx-xxx]
module.vpc.huaweicloud_vpc.this["vpc2"]: Creation complete after 2s [id=yyy-yyy-yyy]
module.vpc.huaweicloud_vpc_subnet.this["vpc1.subnet1"]: Creating...
module.vpc.huaweicloud_vpc_subnet.this["vpc1.subnet1"]: Creation complete after 1s [id=zzz-zzz-zzz]
# ... (Other resource creation outputs)

Apply complete! Resources: 6 added, 0 changed, 0 destroyed.
```

**Note**: The actual output will include details about all resources created, including subnets, flow logs, and VPC peering connections.

## Additional Information

- **Tags**: You can add custom tags to your VPCs using the `tags` variable in the `vpc` configuration.
- **Enterprise Projects**: If you are using Enterprise Projects, specify the project ID in `vpcEnterpriseProject`.
- **Flow Logs**: Enabling flow logs helps you monitor and troubleshoot network traffic.

## Support

If you have any questions or need help, feel free to reach out.