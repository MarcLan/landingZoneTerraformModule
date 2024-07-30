## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | >= 1.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | >= 1.40.0 |

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
| <a name="input_lts_groups"></a> [lts\_groups](#input\_lts\_groups) | Log Tank Service groups configuration | <pre>map(object({<br>    name = string<br>    ttl  = string<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_lts_streams"></a> [lts\_streams](#input\_lts\_streams) | Log Tank Service streams configuration | <pre>map(object({<br>    name     = string<br>    group_id = string<br>    })<br>  )</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lts_group_ids"></a> [lts\_group\_ids](#output\_lts\_group\_ids) | Output Log Tank Service IDs |
