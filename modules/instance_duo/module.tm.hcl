globals {
  ansible_groups = []
}

generate_hcl "_terramate_generated_instance_duo.tf" {
  content {
    resource "aws_key_pair" "this" {
      key_name   = "${global.instance_basename}-key"
      public_key = global.public_key
    }

    module "first_instance" {
      source = "${terramate.stack.path.to_root}/_remote/terraform/modules/ubuntu_instance"

      name           = "${global.instance_basename}-1"
      key_name       = aws_key_pair.this.key_name
      ansible_groups = global.ansible_groups
    }

    module "second_instance" {
      source = "${terramate.stack.path.to_root}/_remote/terraform/modules/ubuntu_instance"

      name           = "${global.instance_basename}-2"
      key_name       = aws_key_pair.this.key_name
      ansible_groups = global.ansible_groups
    }
  }
}
