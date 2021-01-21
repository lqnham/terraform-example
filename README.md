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
- Setup and configure AWS CLI: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html
- Setup Terraform CLI: https://learn.hashicorp.com/tutorials/terraform/install-cli

## Inputs

- Region (default ap-southeast-1)
- AMI ID (default ami-06fb5332e8e3e577a - Ubuntu 18.04 LTS)
- EC2 Instance Type (default t2.micro)

## Outputs

- EC2 Public IP Address

