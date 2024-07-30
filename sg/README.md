<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | 1.50.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | 1.50.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [huaweicloud_networking_secgroup.this](https://registry.terraform.io/providers/huaweicloud/huaweicloud/1.50.0/docs/resources/networking_secgroup) | resource |
| [huaweicloud_networking_secgroup_rule.this](https://registry.terraform.io/providers/huaweicloud/huaweicloud/1.50.0/docs/resources/networking_secgroup_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sgs"></a> [sgs](#input\_sgs) | Security Groups variables | <pre>map(object({<br><br>    name        = string<br>    description = optional(string, null)<br>    rules = map(object({<br><br>      direction        = string<br>      action           = string<br>      ethertype        = string<br>      ports            = string<br>      remote_ip_prefix = string<br>      priority         = optional(string, null)<br>      description      = optional(string, null)<br>      protocol         = optional(string, null)<br>      port_range_min   = optional(string, null)<br>      prot_range_max   = optional(string, null)<br><br>    }))<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sg_ids"></a> [sg\_ids](#output\_sg\_ids) | Out put Security Group IDs for other resources |
<!-- END_TF_DOCS -->