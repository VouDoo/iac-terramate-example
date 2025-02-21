globals {
  ansible_groups = []
}

generate_hcl "_terramate_generated_instance_solo.tf" {
  content {
    resource "aws_key_pair" "this" {
      key_name   = "${global.instance_name}-key"
      public_key = global.public_key
    }

    module "instance" {
      source = "${terramate.stack.path.to_root}/_remote/terraform/modules/ubuntu_instance"

      name           = global.instance_name
      key_name       = aws_key_pair.this.key_name
      ansible_groups = global.ansible_groups
    }
  }
}
