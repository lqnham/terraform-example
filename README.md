# Basic Terraform Example

Configuration in this directory creates:

- An EC2 instance works as a simple HTTP Web Server on port 80.
- A Security Group which allow inbound connections on port 80 (HTTP) and 22 (SSH). Allow all outbound connections.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these
resources.

## Requirements

| Name | Version |
|------|---------|
| terraform | > = 0.14.5 |
| aws | > = 2.70 |

## Providers

| Name | Version |
|------|---------|
| aws | > = 2.65 |

## Inputs

- Region (default ap-southeast-1)

## Outputs

- EC2 Public IP Address

