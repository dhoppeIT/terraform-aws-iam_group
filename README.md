# terraform-aws-iam_group

Terraform module to manage the Amazon Web Services resources (aws_iam_group,
aws_iam_group_membership, aws_iam_group_policy_attachment).

## Graph

<img alt="Graph" src="https://github.com/dhoppeIT/terraform-aws-iam_group/blob/main/rover.svg?raw=true" width="100%" height="100%">

## Usage

Copy and paste into your Terraform configuration, insert the variables and run ```terraform init```:

```hcl
module "aws_iam_user" {
  source = "dhoppeIT/iam_user/aws"

  name          = "dennis.hoppe"
  path          = "/users/"
  force_destroy = true
  tags          = {
    Orchestrator = "Terraform Cloud"
  }

  create_login_profile  = true
  pgp_key_login_profile = "keybase:dhoppeit"

  create_access_key  = true
  pgp_key_access_key = "keybase:dhoppeit"

  create_ssh_key = true
  encoding       = "SSH"
  public_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDgGPwb16ACP3A4UdUkYOK1yUcFV2CZCh0gTyuOp2uR7a69LbtfrXbyxpO1uZUurC4dtNbEJmlccwCFS6nEAJpjNiaNDwZdp8yBlcMDh34kgOTmWN9pyFKUnA+iKOklvRDabR0i+AoNQ4iQ8gfAPTIhampZJez+vapSyNDmt8cQWLtsm5JdPL9pBjfhMLBqgYjms3ccPSAIQ6Ayf4ILbXtOxZRastncmBhJ6iHQ7LruDOlmM2Iary0hvoVwENd4OT4tnq93nzdRPtYPcfK3KsQyJcyAaH9otyabe2DHXGPR2uoUhn8DYDp5FINMYvpvXNwz38XLjDffGQn0LQbgGbDvzr95JWbxZVxqeR9UPI/YiSf3RR8gIAtKotPyhAchMBeZ+KbWZvTBTzueLLifqYIOluWf/Ul+UZrXl0R9NUtcRFZpU/ELBeXNC+D6AnFnMVHj3MwhV8XDb/Ys7qypXyvB6v6crPgMK2XbtA6wNT5qE1Qz6nYvU3IbGlQCvf/p4i7ULWO94Ptm8RMI8siZiAIbO/WBTFn9J+etOLYWcDjcEUZe6tDDcfpcaOJgOkGSY+h5AwpFA32UC7dN2A6HGM5lKU/xjoaAo/9FGuR+Rvfvj2m8lbKZiE9gnxUMZtqq52jKessbNYJBgt/vlh3SrC54xBjQE0PLVGmRvu3umDtiiw== Dennis Hoppe"
}

module "aws_iam_group" {
  source = "dhoppeIT/iam_group/aws"

  name       = "administrator"
  path       = "/groups/"

  users      = [module.aws_iam_user.name]

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
```

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.68 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.74.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The group's name | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | Path in which to create the group | `string` | `"/"` | no |
| <a name="input_policy_arn"></a> [policy\_arn](#input\_policy\_arn) | The ARN of the policy you want to apply | `string` | n/a | yes |
| <a name="input_users"></a> [users](#input\_users) | A list of IAM User names to associate with the Group | `list(string)` | n/a | yes |

## Outputs

No outputs.

<!--- END_TF_DOCS --->

## Authors

Created and maintained by [Dennis Hoppe](https://github.com/dhoppeIT/).

## License

Apache 2 licensed. See [LICENSE](https://github.com/dhoppeIT/terraform-aws-iam_group/blob/main/LICENSE) for full details.
