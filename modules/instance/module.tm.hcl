globals {
  ansible_groups = []
}

generate_hcl "_terramate_generated_instance.tf" {
  content {
    # Get the default VPC
    data "aws_vpc" "default" {
      default = true
    }

    # Get the default subnets in the default VPC
    data "aws_subnet_ids" "default" {
      vpc_id = data.aws_vpc.default.id
    }

    # Generate a unique ID for the instance
    resource "random_id" "unique_id" {
      byte_length = 8
    }

    # Define instance name based on stack name and generated unique ID
    locals {
      instance_name = "${terramate.stack.name}-${random_id.unique_id.hex}"
    }

    # Create a key pair from the provided public key
    resource "aws_key_pair" "this" {
      key_name   = "${local.instance_name}-pubkey"
      public_key = global.public_key
    }

    # Deploy instance
    module "instance" {
      source = "${terramate.stack.path.to_root}/_remote/terraform/modules/ubuntu_instance"

      name      = local.instance_name
      subnet_id = data.aws_subnet_ids.default.ids[0] # Attach to the first default subnet
      key_name  = aws_key_pair.this.key_name
      allow_ssh = true
      groups    = global.ansible_groups
      extra_tags = {
        managed_by = "terraform"
      }
    }
  }
}
